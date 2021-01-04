require 'rails_helper'

RSpec.describe "Api::Categories", type: :request do
  describe 'GET /api/category' do
    before do
      FactoryBot.create(:category)
      FactoryBot.create(:category)
      get '/api/category/'
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

  describe 'POST /api/category' do
    it 'return a category created' do
      stub_name = Faker.name
      expect do
        post '/api/category/', params: { name: stub_name }
      end.to change { Category.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /api/category/:id' do
    let!(:category) { FactoryBot.create(:category) }

    it 'delete a category and return http ok' do
      expect do
        delete "/api/category/#{category.id}"
      end.to change { Category.count }.from(1).to(0)

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT /api/category/:id' do
    let!(:category) { FactoryBot.create(:category) }

    it 'update a category and return http ok' do
      name_for_update = 'fakeNameRandom'
      put "/api/category/#{category.id}", params: { name: name_for_update }

      json_response = JSON.parse(response.body)
      expect(json_response['name']).to eq(name_for_update)
      expect(Category.count).to eq(1)
      expect(response).to have_http_status(:ok)
    end
  end
end
