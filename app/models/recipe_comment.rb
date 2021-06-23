class RecipeComment < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  
  validates :text,presence: true,length: {maximum: 30}
end
