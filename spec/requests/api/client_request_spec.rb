require 'rails_helper'

RSpec.describe "Api::Clients", type: :request do
  describe 'GET /api/client' do
    before do
      FactoryBot.create(:client)
      FactoryBot.create(:client)
      get '/api/client/'
    end

    it 'returns all clients' do
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(2)
    end

    it 'JSON body response contains expected recipe attributes' do
      json_response = JSON.parse(response.body)
      expect(json_response[0].keys).to match_array(%w[id name created_at updated_at category_id
                                                      location_id])
    end
  end
  describe 'POST /api/client' do
    let!(:category) { FactoryBot.create(:category) }
    let!(:location) { FactoryBot.create(:location) }

    it 'return created client' do
      post '/api/client/', params: { name: Faker::Name.name, category_id: category.id, location_id: location.id }
      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /api/client/:id' do
    let!(:client) { FactoryBot.create(:client) }

    it 'delete a client and return http ok' do
      delete "/api/client/#{client.id}"
      expect(Client.count).to eq(0)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT /api/client/:id' do
    let!(:client) { FactoryBot.create(:client) }

    it 'update a client and return http ok' do
      name_for_update = 'fakeNameRandom'
      put "/api/client/#{client.id}", params: { name: name_for_update }

      json_response = JSON.parse(response.body)
      expect(json_response['name']).to eq(name_for_update)
      expect(response).to have_http_status(:ok)
    end
  end
end
