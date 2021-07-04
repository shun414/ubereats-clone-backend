# t.string "name", null: false
# t.integer "fee", default: 0, null: false
# t.integer "time_required", null: false
# t.datetime "created_at", precision: 6, null: false
# t.datetime "updated_at", precision: 6, null: false

FactoryBot.define do
  factory :restaurant do
    sequence(:name) { |n| "TEST_NAME#{n}"}
    fee { 1000 }
    time_required { 20 }
  end
end
