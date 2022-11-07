class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :foods, dependent: :delete_all, foreign_key: 'author_id'
  has_many :recipes, dependent: :delete_all, foreign_key: 'author_id'
 

  validates :name, presence: true
end
