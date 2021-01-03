# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Locations', type: :request do
  describe 'GET /location' do
    before do
      FactoryBot.create(:location)
      FactoryBot.create(:location)
      get '/location/'
    end

    it 'returns all location' do
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(2)
    end

    it 'JSON body response contains expected recipe attributes' do
      json_response = JSON.parse(response.body)
      expect(json_response[0].keys).to match_array(%w[id cep created_at updated_at])
    end
  end

  describe 'POST /location' do
    it 'return a location created' do
      post '/location/', params: { cep: Faker::Address.zip_code }
      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /location/:id' do
    let!(:location) { FactoryBot.create(:location) }

    it 'delete a location and return http ok' do
      delete "/location/#{location.id}"
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT/location/:id' do
    let!(:location) { FactoryBot.create(:location) }

    it 'update a location and return http ok' do
      cep_for_update = '999999'
      put "/location/#{location.id}", params: { cep: cep_for_update }

      json_response = JSON.parse(response.body)
      expect(json_response['cep']).to eq(cep_for_update)
      expect(response).to have_http_status(:ok)
    end
  end
end
