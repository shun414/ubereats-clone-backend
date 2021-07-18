# t.bigint "restaurant_id", null: false
# t.string "name", null: false
# t.integer "price", null: false
# t.text "description", null: false
# t.datetime "created_at", precision: 6, null: false
# t.datetime "updated_at", precision: 6, null: false
# t.index ["restaurant_id"], name:

FactoryBot.define do
  factory :food do
    sequence(:name) { |n| "test_food#{n}"}
    price { 1000 }
    description { "hogehogehoge" }
    restaurant
  end
end
