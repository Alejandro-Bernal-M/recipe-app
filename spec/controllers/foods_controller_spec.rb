require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      user = User.create(name: 'User Test', email: 'test@gmail.com', password: '123456',
                         password_confirmation: '123456')
      sign_in user

      get :index

      expect(response).to be_successful
    end
  end
end
