require 'rails_helper'

RSpec.describe 'Food index', type: :feature do
  before do
    @user = User.create(name: 'User Test', email: 'test@gmail.com', password: '123456')

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    @current_user = @user
    visit foods_path
  end

  describe 'GET #index' do
    before { visit foods_path }
    it 'Has the correct title' do
      expect(page).to have_content('My Foods')
    end
  end
end
