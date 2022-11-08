class Food < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :recipe_foods, dependent: :delete_all, foreign_key: 'food_id'

  validates :name, presence: true, length: { maximum: 250 }
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }


  private
  def food_list
    foods.includes([:user])
  end
end
  