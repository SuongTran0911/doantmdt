class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :nameProduct
      t.float :price
      t.text :content
      t.string :address
      t.integer :discount
      t.string :image_link
      t.string :image_list
      t.integer :view
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end

