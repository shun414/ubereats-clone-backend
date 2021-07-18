require 'rails_helper'

RSpec.describe 'Food', type: :request do
  let(:restaurant) { create(:restaurant) }
  let!(:food) { create(:food, restaurant: restaurant) }

  describe 'GET /foods' do
    it 'returns 200' do
      get "/api/v1/restaurants/#{restaurant.id}/foods"
      expect(response).to have_http_status(:success)
    end
    it 'returns foods' do
      get "/api/v1/restaurants/#{restaurant.id}/foods"
      expect(response.body).to include(food.name)
      expect(response.body).to include(food.price.to_s)
      expect(response.body).to include(food.description)
    end
  end
end
