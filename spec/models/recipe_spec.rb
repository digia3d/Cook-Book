require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:each) do
    User.destroy_all
    @user = User.create(name: 'Alex', email: 'ujvari65@gmail.com', password: '123456')
    @recipe = Recipe.create!(name: 'Pizza', description: 'Njami', preparation_time: '10 min', cooking_time: '10 min',
                             public: true, user: @user)
  end

  it 'shoild create a recipe by current user' do
    expect(@recipe.user).to eq(@user)
  end

  it 'name should be present' do
    expect(@recipe.name).to eq 'Pizza'
  end

  it 'should not be valid without a description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'should not be valid without a preparation_time' do
    subject.preparation_time = ''
    expect(subject).to_not be_valid
  end

  it 'should not be valid without a cooking_time' do
    subject.cooking_time = ''
    expect(subject).to_not be_valid
  end

  it 'name should not be longer than 100 characters' do
    subject.name = 'a' * 101
    expect(subject).to_not be_valid
  end
end
