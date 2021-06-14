class AddRatingToRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :rating, :float
  end
end
