require 'rails_helper'

RSpec.describe 'Recipes Index', type: :feature do
  
    let(:user) { User.create!(name: 'Test User', email: 'test@hotmail.com', password: '123456') }
    before(:each) do
    
    user.save!
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    @recipe1 = Recipe.create(name: 'Test Recipe 1', preparation_time: 10, cooking_time: 10, description: 'Test Description 1', public: true, user: user)
    @recipe2 = Recipe.create(name: 'Test Recipe 2', preparation_time: 10, cooking_time: 10, description: 'Test Description 2', public: false, user: user)

    visit recipes_path

  end

  describe 'GET /recipes' do

    it 'has the recipes names' do
      expect(page).to have_content('Test Recipe 1')
      expect(page).to have_content('Test Recipe 2')
    end

    it 'has the recipes descriptions' do
      expect(page).to have_content(@recipe1.description)
      expect(page).to have_content(@recipe2.description)
    end

    it 'has the correct number of recipes' do
      expect(page).to have_selector('.container', count: 2)
    end
  end
end

  