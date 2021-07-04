require 'rails_helper'

RSpec.describe 'Restaurant', type: :request do
  let!(:restaurant) { create(:restaurant) }

  describe 'GET /restaurants' do
    it 'returns restaurants' do
      get '/api/v1/restaurants'
      expect(response).to have_http_status(:success)
    end
  end
end
