require 'rails_helper'

RSpec.describe 'Recipes New', type: :feature do
  before do
    @user = User.create(name: 'Test User', email: 'test@test.com', password: '123456')

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    @current_user = @user
    visit new_recipe_path
  end

  describe 'GET /recipes/new' do
    before { visit new_recipe_path }

    it 'has the correct title' do
      expect(page).to have_content('Create a new recipe')
    end

    it 'has the correct fields' do
      expect(page).to have_field('Name')
      expect(page).to have_field('Preparation Time')
      expect(page).to have_field('Cooking Time')
      expect(page).to have_field('Description')
    end

    it 'has the correct radio buttons' do
      expect(page).to have_content('Public')
      expect(page).to have_content('Private')
    end

    it 'has the correct buttons' do
      expect(page).to have_button('Create Recipe')
    end
  end
end
