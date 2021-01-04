require 'rails_helper'

RSpec.describe "Api::Consultants", type: :request do
  describe 'GET /api/consultant' do
    before do
      FactoryBot.create(:consultant)
      FactoryBot.create(:consultant)
      get '/api/consultant/'
    end

    it 'returns all consultants' do
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(2)
    end

    it 'JSON body response contains expected recipe attributes' do
      json_response = JSON.parse(response.body)
      expect(json_response[0].keys).to match_array(%w[id name rating created_at updated_at
                                                      total_consultancies])
    end
  end

  describe 'POST /api/consultant' do
    it 'return a consultant created' do
      post '/api/consultant/', params: { name: Faker::Name.name }
      expect(response).to have_http_status(:created)
    end

    it 'total of consultancies start with 0' do
      post '/api/consultant/', params: { name: Faker::Name.name }

      json_response = JSON.parse(response.body)
      expect(json_response['total_consultancies']).to eq(0)
      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /api/consultant/:id' do
    let!(:consultant) { FactoryBot.create(:consultant) }

    it 'delete a client and return http ok' do
      delete "/api/consultant/#{consultant.id}"

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT /api/consultant/:id' do
    let!(:consultant) { FactoryBot.create(:consultant) }

    it 'update a consultant and return http ok' do
      name_for_update = 'fakeNameRandom'
      put "/api/consultant/#{consultant.id}", params: { name: name_for_update }

      json_response = JSON.parse(response.body)
      expect(json_response['name']).to eq(name_for_update)
      expect(response).to have_http_status(:ok)
    end
  end
end
