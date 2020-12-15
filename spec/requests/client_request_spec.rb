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
      expect(json_response[0].keys).to match_array(['id', 'name', 'created_at', 'updated_at'])
    end
  end
  describe "POST /client" do
    it "returns http created" do
      stub_name = Faker::name
      post "/client/", params: {name:stub_name}
        expect(response).to have_http_status(:created)
      end
    it "return a client created" do
      stub_name = Faker::name
      expect{
        post "/client/", params: {name:stub_name}
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

end
