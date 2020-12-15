require 'rails_helper'
require 'faker'

RSpec.describe "Clients", type: :request do

  describe "GET /" do
    before do
      Client.create(name:'guest') #todo use factory
      get "/client/"
    end

    it "returns http success" do
      expect(response).to have_http_status(:ok)
    end
    it "JSON body response contains expected recipe attributes" do
      json_response = JSON.parse(response.body)
      expect(json_response[0].keys).to match_array(['id', 'name', 'created_at', 'updated_at'])
    end
  end
  describe "POST /" do
    it "returns http created" do
      stub_name = Faker::name
      # Todo: use factory
      post "/client/", params: {name:stub_name}
      expect(response).to have_http_status(:created)
      end
    it "returns http created" do
      stub_name = Faker::name
      # Todo: use factory
      post "/client/", params: {name:stub_name}
      expect(response).to have_http_status(:created)
    end
  end

end
