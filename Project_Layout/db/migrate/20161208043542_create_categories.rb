class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :nameCategory
      t.integer :parent_id , default: 0
      t.integer :sort_order

      t.timestamps
    end
  end
end
