require 'rails_helper'

RSpec.describe Food, type: :model do
  user = User.create(name: 'Test User', email: 'test@gmail.com')
  subject { Food.create(name: 'potatoes', price: 5, quantity: 2, measurement_unit: 'grams', user:) }

  before { subject.save }

  context 'Test food validations' do
    it 'name must not be blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'price must not be blank' do
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it 'price must be and integer' do
      subject.price = 'foo'
      expect(subject).to_not be_valid
    end

    it 'quantity must not be blank' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it 'quantity must be and integer' do
      subject.quantity = 'foo'
      expect(subject).to_not be_valid
    end
  end
end
