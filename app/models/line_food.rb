# t.integer "count", default: 0, null: false
# t.boolean "active", default: false, null: false
# t.datetime "created_at", precision: 6, null: false
# t.datetime "updated_at", precision: 6, null: false
# t.bigint "food_id", null: false
# t.bigint "restaurant_id", null: false
# t.bigint "order_id"
# t.index ["food_id"], name: "index_line_foods_on_food_id"
# t.index ["order_id"], name: "index_line_foods_on_order_id"
# t.index ["restaurant_id"], name: "index_line_foods_on_restaurant_id"

class LineFood < ApplicationRecord
  belongs_to :food
  belongs_to :restaurant
  belongs_to :order, optional: true

  validates :count, numericality: { greater_than: 0 }

  scope :active, -> { where(active: true) }
  scope :other_restaurant, -> (picked_restaurant_id) { where.not(restaurant_id: picked_restaurant_id) }

  def total_amount
    food.price * count
  end
end
