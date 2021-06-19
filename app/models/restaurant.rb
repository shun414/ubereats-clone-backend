# t.string "name", null: false
# t.integer "fee", default: 0, null: false
# t.integer "time_required", null: false
# t.datetime "created_at", precision: 6, null: false
# t.datetime "updated_at", precision: 6, null: false

class Restaurant < ApplicationRecord
  has_many :foods
  has_many :line_foods, through: :foods

  validates :name, :fee, :time_required, presence: true
  validates :name, length: { maximum: 30 }
  validates :fee, numericality: { greater_than: 0 }
end
