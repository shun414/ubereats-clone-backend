class AddReferencesToLineFoods < ActiveRecord::Migration[6.0]
  def change
    add_reference :line_foods, :food, null: false, foreign_key: true
    add_reference :line_foods, :restaurant, null: false, foreign_key: true
    add_reference :line_foods, :order, foreign_key: true
  end
end
