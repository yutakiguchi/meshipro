require 'rails_helper'

RSpec.describe Cock, type: :model do
  let(:cock) { create(:cock) }
  let!(:other_cock) {create(:cock)}

  context "バリデーション" do
    it "emailとパスワードがあれば有効" do
      cock = build(:cock)
      expect(cock).to be_valid
    end

    it "emailが空欄ではないか" do
      cock = build(:cock, email: nil)
      cock.valid?
      expect(cock.errors[:email]).to include("を入力してください")
    end

    it "emailに一意性があるか" do
      other_cock = build(:cock, email: cock.email)
      other_cock.valid?
      expect(other_cock.errors[:email]).to include("はすでに存在します")
    end

    it "パスワードが空欄ではないか" do
      cock = build(:cock, password: nil, password_confirmation: nil)
      cock.valid?
      expect(cock.errors[:password]).to include("を入力してください")
    end

    it "パスワードが6文字以上であるか" do
      cock = build(:cock, password: "a"*6, password_confirmation: "a"*6)
      cock.valid?
      expect(cock).to be_valid
    end
  end
end

