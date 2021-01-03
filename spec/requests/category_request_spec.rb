# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET /category' do
    before do
      FactoryBot.create(:category)
      FactoryBot.create(:category)
      get '/category/'
    end

    it 'returns all category' do
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(2)
    end

    it 'JSON body response contains expected recipe attributes' do
      json_response = JSON.parse(response.body)
      expect(json_response[0].keys).to match_array(%w[id name created_at updated_at])
    end
  end

  describe 'POST /category' do
    it 'return a category created' do
      stub_name = Faker.name
      expect do
        post '/category/', params: { name: stub_name }
      end.to change { Category.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /category/:id' do
    let!(:category) { FactoryBot.create(:category) }

    it 'delete a category and return http ok' do
      expect do
        delete "/category/#{category.id}"
      end.to change { Category.count }.from(1).to(0)

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT/category/:id' do
    let!(:category) { FactoryBot.create(:category) }

    it 'update a category and return http ok' do
      name_for_update = 'fakeNameRandom'
      put "/category/#{category.id}", params: { name: name_for_update }

      json_response = JSON.parse(response.body)
      expect(json_response['name']).to eq(name_for_update)
      expect(Category.count).to eq(1)
      expect(response).to have_http_status(:ok)
    end
  end
end
