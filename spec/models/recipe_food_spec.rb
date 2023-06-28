require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  user = User.create(name: 'Test User', email: 'test@test.com')
  recipe = Recipe.create(name: 'Test Recipe', preparation_time: 10, cooking_time: 10, description: 'Test Description', public: true, user: user)
  food = Food.create(name: 'Test Food', user: user, measurement_unit: 'grams', price: 10, quantity: 10)
  recipe_food = RecipeFood.create(recipe: recipe, food: food, quantity: 5)

  it 'is valid with valid attributes' do
    expect(recipe_food).to be_valid
  end
  
  it 'have the rigth quantity' do
    expect(recipe_food.quantity).to eq(5)
  end

  it 'is not valid without a recipe' do
    recipe_food.recipe = nil
    expect(recipe_food).to_not be_valid
  end

  it 'is not valid without a food' do
    recipe_food.food = nil
    expect(recipe_food).to_not be_valid
  end

  it 'is not valid without a quantity' do
    recipe_food.quantity = nil
    expect(recipe_food).to_not be_valid
  end
  

  it 'is not valid with a quantity less than 0' do
    recipe_food.quantity = -1
    expect(recipe_food).to_not be_valid
  end

end