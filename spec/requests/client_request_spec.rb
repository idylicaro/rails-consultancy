require 'rails_helper'
require 'faker'

RSpec.describe "Clients", type: :request do

  describe "GET /client" do
    before do
      FactoryBot.create(:client)
      FactoryBot.create(:client)
      get "/client/"
    end

    it "returns all clients" do
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(2)
    end

    it "JSON body response contains expected recipe attributes" do
      json_response = JSON.parse(response.body)
      expect(json_response[0].keys).to match_array(['id', 'name', 'created_at', 'updated_at','category_id','location_id'])
    end
  end
  describe "POST /client" do
    let!(:category) { FactoryBot.create(:category) }
    let!(:location) { FactoryBot.create(:location) }

    it "return created client" do
      stub_name = Faker::name
      expect{
        post "/client/", params: {name:stub_name, category_id: category.id, location_id: location.id }
      }.to change { Client.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe "DELETE /client/:id" do
    let!(:client) { FactoryBot.create(:client) }

    it "delete a client and return http ok" do
      expect{
        delete "/client/#{client.id}"
      }.to change { Client.count }.from(1).to(0)

      expect(response).to have_http_status(:ok)
    end

  end

  describe "PUT/client/:id" do
    let!(:client) { FactoryBot.create(:client) }

    it "update a client and return http ok" do
      name_for_update = 'fakeNameRandom'
      put "/client/#{client.id}", params: {name:name_for_update}


      json_response = JSON.parse(response.body)
      expect(json_response['name']).to eq(name_for_update)
      expect(Client.count).to eq(1)
      expect(response).to have_http_status(:ok)
    end
  end

end
