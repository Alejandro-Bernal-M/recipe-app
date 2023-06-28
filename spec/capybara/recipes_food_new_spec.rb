require 'rails_helper'

RSpec.describe 'Recipes Food New', type: :feature do
  before do
    @user = User.create(name: 'Test User', email: 'test@test.com', password: '123456')
    @recipe1 = Recipe.create(name: 'Test Recipe 1', preparation_time: 10, cooking_time: 10, description: 'Test Description 1', public: true, user: @user)
    @food1 = Food.create(name: 'Test Food 1', user: @user, measurement_unit: 'grams', price: 10, quantity: 10)

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    @current_user = @user
    visit new_recipe_food_path(@recipe1)
  end

  describe 'GET /recipe/:id/food/new' do
    before { visit new_recipe_food_path(@recipe1)}

    it 'Has the correct title' do
      expect(page).to have_content('Add A New Ingredient')
    end

    it 'Has the recipe name' do
      expect(page).to have_content("Adding ingredient for the #{@recipe1.name} recipe")
    end

    it 'Has the correct elements' do
      expect(page).to have_content('Select one food')
    end

    it 'Has the correct content of the table' do
      expect(page).to have_content('Name')
      expect(page).to have_content('Measurement Unit')
      expect(page).to have_content('Unit Price')
      expect(page).to have_content('Actions')
    end

    it 'Has the food name' do
      expect(page).to have_content(@food1.name)
    end

    it 'Has the quantity field' do
      expect(page).to have_field('quantity')
    end

    it 'Has the correct button' do
      expect(page).to have_button('Add ingredient')
    end
  end
end
