class Restaurant < ApplicationRecord
 belongs_to :cock
 has_many :restaurant_comments,dependent: :destroy
 has_many :my_restaurants,dependent: :destroy
 attachment :image

 include JpPrefecture
 jp_prefecture :prefecture_code

def prefecture_name
  name=JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  if name==nil
    name=""
  end
  name 
end


def prefecture_name=(prefecture_name)
  self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
end

def favorited_by?(user)
    my_restaurants.where(user_id: user.id).exists?
end

def full_address(restaurant)
  self.prefecture_name + self.address_city + self.address_street
end


 validates :name, presence: true
 validates :postcode, presence: true
 validates :prefecture_code, presence: true
 validates :address_city, presence: true
 validates :address_street, presence: true
 validates :business_start, presence: true
 validates :business_finish, presence: true
 validates :description, length: {maximum: 30}


geocoded_by :address       #カラムを基準に経度と緯度を算出
after_validation :geocode



end
