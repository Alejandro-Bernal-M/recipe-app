require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.create(name: 'Test User', email: 'test@test.com', password: '123456')

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'name must not be blank' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
