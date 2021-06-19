# t.bigint "restaurant_id", null: false
# t.string "name", null: false
# t.integer "price", null: false
# t.text "description", null: false
# t.datetime "created_at", precision: 6, null: false
# t.datetime "updated_at", precision: 6, null: false
# t.index ["restaurant_id"], name: 

class Food < ApplicationRecord
  belongs_to :restaurant
  belongs_to :order, optional: true
  has_one :line_food
end
