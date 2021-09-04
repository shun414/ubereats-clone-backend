require 'rails_helper'

RSpec.describe 'Line_foods', type: :request do
  let(:restaurant_1) { create(:restaurant) }
  let(:restaurant_2) { create(:restaurant) }
  let!(:food_1) { create(:food, restaurant: restaurant_1) }
  let!(:food_2) { create(:food, restaurant: restaurant_2) }
  let!(:line_food_1) { create(:line_food, restaurant: restaurant_1) }

  describe 'POST /line_foods' do
    it 'returns 200' do
      post "/api/v1/line_foods", params: { food_id: food_1.id, count: 1 }
      expect(response).to have_http_status(:success)
      expect(LineFood.last.count).to equal(1)
    end

    it 'unable to post LineFood when existing other restaurant LineFood' do
      post "/api/v1/line_foods", params: { food_id: food_2.id, count: 1 }
      expect(response).to have_http_status(406)
    end
  end

  describe 'GET /line_foods' do
    it 'returns 200' do
      get "/api/v1/line_foods"
      expect(response).to have_http_status(:success)
    end

    it 'returns food' do
      get "/api/v1/line_foods"
      expect(response.body).to include(restaurant_1.name)
      expect(response.body).to include(restaurant_1.fee.to_s)
      expect(response.body).to include(restaurant_1.time_required.to_s)
    end
  end

  describe 'PUT /line_foods/replace' do
    it 'returns new line_food and existing line_food active become false' do
      put "/api/v1/line_foods/replace", params: { food_id: food_2.id, count: 1 }
      expect(response).to have_http_status(:success)
      expect(response.body).to include(food_2.id.to_s)
      expect(LineFood.other_restaurant(restaurant_2.id).active).to eq([])
    end
  end
end
