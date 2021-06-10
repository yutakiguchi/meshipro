class Recipe < ApplicationRecord
  belongs_to :cock
  has_many :recipe_comments,dependent: :destroy
  has_many :recipe_images,dependent: :destroy
  has_many :my_recipes,dependent: :destroy
  accepts_attachments_for :recipe_images,attachment: :image
  
  def liked_by?(user)
    MyRecipe.where(user_id: user.id).exists?
  end  
end
