class Inventory < ActiveRecord::Migration[5.0]
  def change
    create_table :inventories do |t|
      t.integer :product_id, null: false
      t.integer :waist, null: false
      t.integer :length, null: false
      t.string :style, null: false
      t.integer :count, null: false
      t.timestamps null: false
    end
  end
end
