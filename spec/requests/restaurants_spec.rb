require 'rails_helper'

RSpec.describe 'Restaurant', type: :request do
  let!(:restaurant) { create(:restaurant) }

  describe 'GET /restaurants' do
    it 'returns 200' do
      get '/api/v1/restaurants'
      expect(response).to have_http_status(:success)
    end
    it 'returns restaurants' do
      get '/api/v1/restaurants'
      pp response.body
      pp restaurant.fee
      expect(response.body).to include(restaurant.name)
      expect(response.body).to include(restaurant.fee.to_s)
      expect(response.body).to include(restaurant.time_required.to_s)
    end
  end
end
