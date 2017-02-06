class Products < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :product_id null: false
      t.string :product_name null: false
      t.string :product_image
      t.text :description
      t.timestamps null:false
    end
  end
end
