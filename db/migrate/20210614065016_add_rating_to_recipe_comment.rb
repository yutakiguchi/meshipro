class AddRatingToRecipeComment < ActiveRecord::Migration[5.2]
  def change
    add_column :recipe_comments, :rating, :float
  end
end
