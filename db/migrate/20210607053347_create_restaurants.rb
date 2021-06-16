class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.integer :cock_id
      t.string :name
      t.string :image_id
      t.text :description
      t.integer :postcode
      t.integer :prefecture_code
      t.string :address_street
      t.string :address_city
      t.string :address_building
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
