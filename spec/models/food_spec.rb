require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'validations and associations' do
    it 'should not be valid without a name' do
      food = Food.new
      expect(food).to_not be_valid
    end

    it 'should belongs_to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
  end
end
