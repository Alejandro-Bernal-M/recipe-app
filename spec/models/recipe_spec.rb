require 'rails_helper'

RSpec.describe Recipe, type: :model do
  user = User.create(name: 'Test User', email: 'test@test.com')
  recipe = Recipe.create(name: 'Test Recipe', preparation_time: 10, cooking_time: 10, description: 'Test Description',
                         public: true, user: user)

  it 'is valid with valid attributes' do
    expect(recipe).to be_valid
  end

  it 'is not valid without a name' do
    recipe.name = nil
    expect(recipe).to_not be_valid
  end

  it 'is not valid without a preparation time' do
    recipe.preparation_time = nil
    expect(recipe).to_not be_valid
  end

  it 'is not valid without a cooking time' do
    recipe.cooking_time = nil
    expect(recipe).to_not be_valid
  end

  it 'is not valid without a description' do
    recipe.description = nil
    expect(recipe).to_not be_valid
  end
end
