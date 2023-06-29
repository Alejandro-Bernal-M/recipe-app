require 'rails_helper'

RSpec.describe 'Food index page', type: :feature do
  before(:each) do
    @user = User.create!(name: 'User Test', email: 'test@gmailtest.com', password: '123456',
                         password_confirmation: '123456')
    @food = Food.create!(name: 'potatoes', price: 5, quantity: 2, measurement_unit: 'grams', user: @user)
    @user.save!
    visit new_user_session_path
    fill_in 'user_email', with: 'test@gmailtest.com'
    fill_in 'user_password', with: '123456'
    click_button 'Log in'
    visit foods_path(@user)
  end

  describe 'the post index page' do
    it 'displays the title' do
      visit foods_path
      sleep 1
      expect(page).to have_content('My Foods')
    end

    it 'displays the food' do
      visit foods_path(@user)
      sleep 1
      expect(page).to have_content('potatoes')
    end
  end
end