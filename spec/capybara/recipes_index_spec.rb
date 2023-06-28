require 'rails_helper'

RSpec.describe 'Recipes Index', type: :feature do
  before do
    @user = User.create(name: 'Test User', email: 'test@test.com', password: '123456')
    @recipe1 = Recipe.create(name: 'Test Recipe 1', preparation_time: 10, cooking_time: 10,
                             description: 'Test Description 1', public: true, user: @user)
    @recipe2 = Recipe.create(name: 'Test Recipe 2', preparation_time: 10, cooking_time: 10,
                             description: 'Test Description 2', public: false, user: @user)

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    @current_user = @user
  end

  describe 'GET /recipes' do
    it 'has the recipes names' do
      expect(page).to have_content('TEST RECIPE 1')
      expect(page).to have_content('TEST RECIPE 2')
    end

    it 'has the recipes descriptions' do
      expect(page).to have_content(@recipe1.description)
      expect(page).to have_content(@recipe2.description)
    end

    it 'has the correct number of recipes' do
      expect(page).to have_selector('.container', count: 2)
    end

    it 'renders the right message when there are no recipes' do
      @recipe1.destroy
      @recipe2.destroy
      visit recipes_path
      expect(page).to have_content('There Are No Recipes')
    end
  end
end
