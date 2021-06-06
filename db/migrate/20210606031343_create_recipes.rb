class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :cock_id
      t.string :name
      t.text :explanation
      t.text :material
      t.text :cook_text

      t.timestamps
    end
  end
end
