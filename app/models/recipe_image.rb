class RecipeImage < ApplicationRecord
  belongs_to :recipe
  attachment :image
end
