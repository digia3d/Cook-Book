require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    User.destroy_all
    @user = User.create(name: 'Alex', email: 'ujvari65@gmail.com', password: '123456')
  end

  it 'should create a user' do
    expect(@user.name).to eq('Alex')
  end

  it 'should not create a user' do
    expect(@user.name).to eq('Alex')
  end

  it 'should not be valid without a name' do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end

  it 'should not be valid without an email' do
    user = User.new(email: nil)
    expect(user).to_not be_valid
  end

  it 'should not be valid without a password' do
    user = User.new(password: nil)
    expect(user).to_not be_valid
  end
end
