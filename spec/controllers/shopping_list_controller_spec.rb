require 'rails_helper'

RSpec.describe ShoppingListController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      user = User.create(name: 'User Test', email: 'test@gmail.com', password: '123456',
                         password_confirmation: '123456')
      Food.create(name: 'potatoes', price: 5, quantity: 2, measurement_unit: 'grams', user:)
      Recipe.create(name: 'rice', preparation_time: '2', cooking_time: '1')
      sign_in user

      get :index

      expect(response).to be_successful
    end
  end
end
