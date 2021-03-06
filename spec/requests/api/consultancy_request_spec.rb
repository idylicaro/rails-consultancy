require 'rails_helper'

RSpec.describe "Api::Consultancies", type: :request do
  describe 'GET /api/consultancy' do
    before do
      client1 = FactoryBot.create(:client)
      consultant1 = FactoryBot.create(:consultant)
      client2 = FactoryBot.create(:client)
      consultant2 = FactoryBot.create(:consultant)
      Consultancy.create(client: client1, consultant: consultant1, rating: 0)
      Consultancy.create(client_id: client2.id, consultant_id: consultant2.id, rating: 0)
      get '/api/consultancy/'
    end

    it 'returns all consultancies' do
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(2)
    end

    it 'JSON body response contains expected recipe attributes' do
      json_response = JSON.parse(response.body)
      expect(json_response[0].keys).to match_array(%w[client_id closed consultant_id created_at end_date id rating
                                                      updated_at])
    end
  end

  describe 'POST /api/consultancy' do
    let!(:client) { FactoryBot.create(:client) }
    let!(:consultant) { FactoryBot.create(:consultant) }

    it 'return a consultancy created' do
      expect do
        post '/api/consultancy/', params: { client_id: client.id, consultant_id: consultant.id }
      end.to change { Consultancy.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /api/consultancy/:id' do
    let!(:client) { FactoryBot.create(:client) }
    let!(:consultant) { FactoryBot.create(:consultant) }

    it 'delete a consultancy and return http ok' do
      consultancy = Consultancy.create(client: client, consultant: consultant, rating: 0)
      expect do
        delete "/api/consultancy/#{consultancy.id}"
      end.to change { Consultancy.count }.from(1).to(0)

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT /api/consultancy/:id' do
    let!(:client) { FactoryBot.create(:client) }
    let!(:consultant) { FactoryBot.create(:consultant) }

    it 'close consultancy and return ok' do
      consultancy = Consultancy.create(client: client, consultant: consultant, rating: 0)
      put "/api/consultancy/#{consultancy.id}", params: { rating: 5 }
      json_response = JSON.parse(response.body)
      expect(json_response['closed']).to eq(true)
      expect(json_response['rating']).to eq(5)
      expect(response).to have_http_status(:ok)
    end

    it 'ensure update consultant rating' do
      consultancy = Consultancy.create(client: client, consultant: consultant, rating: 0)
      put "/api/consultancy/#{consultancy.id}", params: { rating: 5 }
      expect(Consultant.find(consultant.id).rating).to eq(5)
      expect(response).to have_http_status(:ok)
    end
  end
end
