# create_table "inventories", force: :cascade do |t|
#   t.integer  "product_id", null: false
#   t.integer  "waist",      null: false
#   t.integer  "length",     null: false
#   t.string   "style",      null: false
#   t.integer  "count",      null: false
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end


class Inventory < ActiveRecord::Base

  validates :product_id, :waist, :length, :style, :count, presence: true

  has_many :products

end

