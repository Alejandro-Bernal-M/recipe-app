require 'rails_helper'

RSpec.describe 'Recipes Food Edit', type: :feature do
  before do
    @user = User.create(name: 'Test User', email: 'test@test.com', password: '123456')
    @recipe1 = Recipe.create(name: 'Test Recipe 1', preparation_time: 10, cooking_time: 10,
                             description: 'Test Description 1', public: true, user: @user)
    @food1 = Food.create(name: 'Test Food 1', user: @user, measurement_unit: 'grams', price: 10, quantity: 10)
    @recipe_food1 = RecipeFood.create(recipe: @recipe1, food: @food1, quantity: 5)

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    @current_user = @user
    visit edit_recipe_food_path(recipe_id: @recipe1.id, id: @recipe_food1.id)
  end

  describe 'GET /recipe/:id/food/new' do
    before { visit edit_recipe_food_path(recipe_id: @recipe1.id, id: @recipe_food1.id) }

    it 'Has the correct title' do
      expect(page).to have_content('Editing The Quantity For Test Food 1')
    end

    it 'Has the go back link' do
      expect(page).to have_link('Cancel, go back', href: recipe_path(@recipe1))
    end

    it 'Has the correct elements' do
      expect(page).to have_field('quantity')
      expect(page).to have_button('Update quantity')
    end

    it 'Updates the quantity' do
      fill_in 'quantity', with: 10
      click_button 'Update quantity'
      sleep(1)
      expect(current_path).to eq(recipe_path(@recipe1))
      expect(page).to have_content('10')
    end
  end
end
