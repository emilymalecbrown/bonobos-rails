  # create_table "products", force: :cascade do |t|
  #   t.integer  "product_id",    null: false
  #   t.string   "product_name",  null: false
  #   t.string   "product_image"
  #   t.text     "description"
  #   t.datetime "created_at",    null: false
  #   t.datetime "updated_at",    null: false
  # end

class Product < ActiveRecord::Base

  validates :product_id, :product_name, presence: true

end
