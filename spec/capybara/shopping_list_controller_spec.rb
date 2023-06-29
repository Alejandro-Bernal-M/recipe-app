require 'rails_helper'

RSpec.describe 'Shopping index', type: :feature do
  before do
    @user = User.create(name: 'User Test', email: 'test@gmail.com', password: '123456',
                        password_confirmation: '123456')
    Food.create(name: 'potatoes', price: 5, quantity: 2, measurement_unit: 'grams', user: @user)
    Recipe.create(name: 'rice', preparation_time: '2', cooking_time: '1', description: 'test',
                  public: true, user: @user)
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    @current_user = @user
    visit shopping_list_path
  end

  describe 'GET #index' do
    before { visit shopping_list_path }

    it 'Has the correct title' do
      expect(page).to have_content('Shopping List')
    end

    it 'displays food needed' do
      visit shopping_list_path
      expect(page).to have_content('Total value of food needed:')
    end
  end
end
