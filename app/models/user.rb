class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipe_comments,dependent: :destroy
  has_many :restaurant_comments,dependent: :destroy
  has_many :my_recipes,dependent: :destroy
  has_many :my_restaurants,dependent: :destroy
end
