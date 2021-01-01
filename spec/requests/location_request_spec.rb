require 'rails_helper'

RSpec.describe "Locations", type: :request do

  describe "GET /location" do
    before do
      FactoryBot.create(:location)
      FactoryBot.create(:location)
      get "/location/"
    end

    it "returns all location" do
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(2)
    end

    it "JSON body response contains expected recipe attributes" do
      json_response = JSON.parse(response.body)
      expect(json_response[0].keys).to match_array(['id', 'cep', 'created_at', 'updated_at'])
    end
  end

  describe "POST /location" do

    it "return a location created" do
      stub_cep = Faker::Address.zip_code
      expect{
        post "/location/", params: {cep:stub_cep}
      }.to change { Location.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
    end
  end

end
