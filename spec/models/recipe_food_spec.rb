require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  subject do
    User.create(name: 'User Test', email: 'test@gmail.com', password: '123456', password_confirmation: '123456')
  end

  before do 
    @food = Food.create(name: 'potatoes', price: 5, quantity: 2, measurement_unit: 'grams', user: subject)
    @recipe = Recipe.create(name: 'rice', preparation_time: '2', cooking_time: '1')
    @recipe_food = RecipeFood.create(recipe: @recipe, food: @food, quantity: 5)
  end

  context 'Test Recipe validations' do
    it 'is valid with valid attributes' do
      expect(@recipe_food).to be_valid
    end

    it 'quantity must not be blank' do
      @recipe_food.quantity = nil
      expect(@recipe_food).to_not be_valid
    end

    it 'quantity must be and integer' do
      @recipe_food.quantity = 'foo'
      expect(@recipe_food).to_not be_valid
    end
  end
end