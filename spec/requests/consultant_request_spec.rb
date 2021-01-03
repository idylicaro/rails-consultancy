require 'rails_helper'

RSpec.describe "Consultants", type: :request do

  describe "GET /consultant" do
    before do
      FactoryBot.create(:consultant)
      FactoryBot.create(:consultant)
      get "/consultant/"
    end

    it "returns all consultants" do
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(2)
    end

    it "JSON body response contains expected recipe attributes" do
      json_response = JSON.parse(response.body)
      expect(json_response[0].keys).to match_array(['id', 'name','rating', 'created_at', 'updated_at','total_consultancies'])
    end
  end

  describe "POST /consultant" do
    it "return a consultant created" do
      post "/consultant/", params: {name:Faker::Name.name}
      expect(response).to have_http_status(:created)
    end

    it "total of consultancies start with 0" do
      post "/consultant/", params: {name:Faker::Name.name}

      json_response = JSON.parse(response.body)
      expect(json_response["total_consultancies"]).to eq(0)
      expect(response).to have_http_status(:created)
    end

  end

  describe "DELETE /consultant/:id" do
    let!(:consultant) { FactoryBot.create(:consultant) }

    it "delete a client and return http ok" do
      delete "/consultant/#{consultant.id}"

      expect(response).to have_http_status(:ok)
    end

  end

  describe "PUT/consultant/:id" do
    let!(:consultant) { FactoryBot.create(:consultant) }

    it "update a consultant and return http ok" do
      name_for_update = 'fakeNameRandom'
      put "/consultant/#{consultant.id}", params: {name:name_for_update}

      json_response = JSON.parse(response.body)
      expect(json_response['name']).to eq(name_for_update)
      expect(response).to have_http_status(:ok)
    end
  end

end
