require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  let(:cock){ create(:cock) }
  let!(:restaurant) { create(:restaurant, cock_id: cock.id) }

  context "バリデーション"do
    it "nameとdescription、postcode、prefecture_code、address_city,address_building、latitude、longitudeで有効"do
      restaurant = build(:restaurant)
      expect(restaurant).to be_valid
    end

    it "nameが空では登録できないこと"do
      restaurant = build(:restaurant, name: nil)
      restaurant.valid?
      expect(restaurant.errors[:name]).to include("を入力してください")
    end

    it "descriptionが30文字以下だと登録できる"do
      restaurant = build(:restaurant, description: "a"*30)
      restaurant.valid?
      expect(restaurant).to be_valid
    end

    it "descriptionが31文字以上だと登録できる"do
      restaurant = build(:restaurant, description: "a"*31)
      restaurant.valid?
      expect(restaurant).to be_invalid
    end

    it "postcodeが空では登録できないこと"do
      restaurant = build(:restaurant, postcode: nil)
      restaurant.valid?
      expect(restaurant.errors[:postcode]).to include("を入力してください")
    end

    it "prefecture_codeが空では登録できないこと"do
      restaurant = build(:restaurant, prefecture_code: nil)
      restaurant.valid?
      expect(restaurant.errors[:prefecture_code]).to include("を入力してください")
    end

    it "address_cityが空では登録できないこと"do
      restaurant = build(:restaurant, address_city: nil)
      restaurant.valid?
      expect(restaurant.errors[:address_city]).to include("を入力してください")
    end

    it "address_streetが空では登録できないこと"do
      restaurant = build(:restaurant, address_street: nil)
      restaurant.valid?
      expect(restaurant.errors[:address_street]).to include("を入力してください")
    end

    it "address_buildingが空でも登録できること" do
      restaurant = build(:restaurant, address_building: nil)
      expect(restaurant).to be_valid
    end
  end
end
