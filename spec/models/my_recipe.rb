require 'rails_helper'

RSpec.describe MyRecipe, type: :model do
  let!(:my_recipe) { create(:my_recipe) }

  it "my_recipeが有効であること" do
    expect(my_recipe).to be_valid
  end

  it "user_idがnilの場合、無効であること" do
    favorite.user_id = nil
    expect(my_recipe).to be_invalid
  end

  it "dish_idがnilの場合、無効であること" do
    favorite.recipe_id = nil
    expect(my_recipe).to be_invalid
  end
end