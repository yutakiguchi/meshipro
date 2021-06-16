class Restaurant < ApplicationRecord
 belongs_to :cock
 has_many :restaurant_comments,dependent: :destroy
 has_many :my_restaurants,dependent: :destroy
 attachment :image

 include JpPrefecture
 jp_prefecture :prefecture_code

def prefecture_name
  JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
end

def prefecture_name=(prefecture_name)
  self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
end

def favorited_by?(user)
    my_restaurants.where(user_id: user.id).exists?
end



geocoded_by :address       #カラムを基準に経度と緯度を算出
after_validation :geocode



end
