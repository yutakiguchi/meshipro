require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:cock){ create(:cock)}
  let!(:recipe) { create(:recipe, cock_id: cock.id) }

  context "バリデーション"do
    it "nameとcook_textがあれば登録"do
      recipe = build(:recipe)
      expect(recipe).to be_valid
    end

    it "nameがなければ登録できない"do
      recipe = build(:recipe, name: nil)
      recipe.valid?
      expect(recipe.errors[:name]).to include("を入力してください")
    end

    it "cook_textがなければ登録できない"do
      recipe = build(:recipe, cook_text: nil)
      recipe.valid?
      expect(recipe.errors[:cook_text]).to include("を入力してください")
    end
  end
end
