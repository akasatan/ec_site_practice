class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.references :genre_id, foreign_key: true
      t.string :name
      t.text :description
      t.integer :price
      t.string :product_image_id
      t.boolean :is_valid, default: true

      t.timestamps
    end
  end
end
