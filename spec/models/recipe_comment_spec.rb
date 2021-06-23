require 'rails_helper'

RSpec.describe RecipeComment, type: :model do
  let!(:recipe_comment){create(:recipe_comment)}

  context "バリデーション" do
    it "有効であるか"do
      expect(recipe_comment).to be_valid
    end

    it "user_idがなければ登録できない" do
      recipe_comment = build(:recipe_comment, user_id: nil)
      expect(recipe_comment).to be_invalid
    end

    it "recipe_idがなければ登録できない"do
      recipe_comment = build(:recipe_comment, recipe_id: nil)
      expect(recipe_comment).to be_invalid
    end

    it "textがなければ登録できない"do
      recipe_comment = build(:recipe_comment, text: nil)
      expect(recipe_comment).to be_invalid
    end

    it "内容が30文字以内であること" do
      recipe_comment = build(:recipe_comment, text: "a"*30)
      recipe_comment.valid?
      expect(recipe_comment).to be_valid
    end
  end
end
