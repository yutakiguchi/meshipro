class Recipe < ApplicationRecord
  belongs_to :cock
  has_many :materials,dependent: :destroy
  #cocoonで子フォームを親と一緒に保存する。　accepts_nested_attributes_for
  accepts_nested_attributes_for :materials, allow_destroy: true
  has_many :recipe_comments,dependent: :destroy
  has_many :recipe_images,dependent: :destroy
  has_many :my_recipes,dependent: :destroy
  accepts_attachments_for :recipe_images,attachment: :image

  validates :name,presence: true
  validates :cook_text,presence: true


  def favorited_by?(user)
    my_recipes.where(user_id: user.id).exists?
  end
end
