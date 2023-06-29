require 'rails_helper'

RSpec.describe 'Shopping list page', type: :feature do
  before(:each) do
    @user = User.create!(name: 'User Test', email: 'test@gmail1.com', password: '123456',
                         password_confirmation: '123456')
    @food = Food.create!(name: 'potatoes', price: 5, quantity: 2, measurement_unit: 'grams', user: @user)
    @recipe = Recipe.create(name: 'rice', preparation_time: '2', cooking_time: '1')
    @recipe_food = RecipeFood.create(recipe: @recipe, food: @food, quantity: 3)
    @user.save!
    visit new_user_session_path
    fill_in 'user_email', with: 'test@gmail1.com'
    fill_in 'user_password', with: '123456'
    click_button 'Log in'
    visit shopping_list_path
  end

  describe 'Shopping list page' do
    it 'displays the title' do
      visit shopping_list_path
      expect(page).to have_content('Shopping List')
    end

    it 'displays food needed' do
      visit shopping_list_path
      expect(page).to have_content('Total value of food needed:')
    end
  end
end
