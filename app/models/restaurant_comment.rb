class RestaurantComment < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :text,presence: true,length: {maximum: 30}
end
