class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipe_comments, dependent: :destroy
  has_many :restaurant_comments, dependent: :destroy
  has_many :my_recipes, dependent: :destroy
  has_many :my_restaurants, dependent: :destroy

  before_save :downcase_email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i # メールアドレスの正規表現
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :nickname, presence: true, length: { maximum: 15, minmum: 2 }
  validates :password, presence: true, length: { minimum: 6 }
  
  private

  def downcase_email
    self.email = email.downcase
  end
end
