class AddRatingToRestaurantComment < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurant_comments, :rating, :float
  end
end
