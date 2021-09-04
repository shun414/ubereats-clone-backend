# t.integer "total_price", default: 0, null: false
# t.datetime "created_at", precision: 6, null: false
# t.datetime "updated_at", precision: 6, null: false

FactoryBot.define do
  factory :order do
    total_price { 1000 }
  end
end
