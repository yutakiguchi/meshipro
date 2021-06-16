class AddColumnsToRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :business_start, :time
    add_column :restaurants, :business_finish, :time
  end
end
