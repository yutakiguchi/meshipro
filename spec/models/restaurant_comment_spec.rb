require 'rails_helper'

RSpec.describe RestaurantComment, type: :model do
  let!(:restaurant_comment){create(:restaurant_comment)}

  context "バリデーション" do
    it "有効であるか"do
      expect(restaurant_comment).to be_valid
    end

    it "user_idがなければ登録できない" do
      restaurant_comment = build(:restaurant_comment, user_id: nil)
      expect(restaurant_comment).to be_invalid
    end

    it "restaurant_idがなければ登録できない"do
      restaurant_comment = build(:restaurant_comment, restaurant_id: nil)
      expect(restaurant_comment).to be_invalid
    end

    it "textがなければ登録できない"do
      restaurant_comment = build(:restaurant_comment, text: nil)
      expect(restaurant_comment).to be_invalid
    end

    it "内容が30文字以内であること" do
      restaurant_comment = build(:restaurant_comment, text: "a"*30)
      restaurant_comment.valid?
      expect(restaurant_comment).to be_valid
    end
  end
end
