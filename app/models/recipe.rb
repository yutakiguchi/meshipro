class Recipe < ApplicationRecord
  belongs_to :cock
  has_many :recipe_images,dependent: :destroy
  accepts_attachments_for :recipe_images,attachment: :image
end
