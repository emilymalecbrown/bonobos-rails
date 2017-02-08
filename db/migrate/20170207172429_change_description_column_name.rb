class ChangeDescriptionColumnName < ActiveRecord::Migration[5.0]

  def change
    remove_column :products, :description
    add_column :products, :product_description, :text
  end

end

