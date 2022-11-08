class Recipe < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :recipe_foods, dependent: :destroy, class_name: 'RecipeFood'
  has_many :foods, through: :recipe_foods, class_name: 'Food'

  validates :name, presence: true
  validates :description, presence: true
end
