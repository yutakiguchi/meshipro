class CreateMyRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :my_recipes do |t|
      t.references :user, foreign_key: true
      t.references :recipe, foreign_key: true
      t.timestamps
    end
  end
end
