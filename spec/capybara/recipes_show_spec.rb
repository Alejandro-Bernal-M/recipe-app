require 'rails_helper'

RSpec.describe 'Recipes Show', type: :feature do
  before do
    @user = User.create(name: 'Test User', email: 'test@test.com', password: '123456')
    @recipe1 = Recipe.create(name: 'Test Recipe 1', preparation_time: 10, cooking_time: 10, description: 'Test Description 1', public: true, user: @user)

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    @current_user = @user
    visit recipe_path(@recipe1)
  end
  
  describe 'GET /recipe/:id' do
    before { visit recipe_path(@recipe1)}

    it 'has the recipe name' do
      expect(page).to have_content('Test Recipe 1')
    end

    it 'has the recipe description' do
      expect(page).to have_content('Test Description 1')
    end

    it 'has the recipe preparation time' do
      expect(page).to have_content('10')
    end

    it 'has the recipe cooking time' do
      expect(page).to have_content('10')
    end

    it 'has the right buttons' do
      expect(page).to have_button('Generate Shopping List', exact: true)
      expect(page).to have_button('Add new ingredient', exact: true)
    end
  end

end