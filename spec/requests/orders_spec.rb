require 'rails_helper'

RSpec.describe 'Order', type: :request do
  let(:restaurant) { create(:restaurant, fee: 500) }
  let!(:food) { create(:food, price: 1000, restaurant: restaurant) }
  let!(:line_food) { create(:line_food, restaurant: restaurant) }

  describe 'POST /orders' do
    it 'returns 200' do
      post "/api/v1/orders", params: { line_food_ids: line_food.id }
      expect(response).to have_http_status(:success)
      expect(Order.last.total_price).to equal(1500)
    end
  end
end
