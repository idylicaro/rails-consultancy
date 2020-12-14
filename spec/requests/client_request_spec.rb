require 'rails_helper'
require 'faker'

RSpec.describe "Clients", type: :request do

  describe "GET /" do
    it "returns all clients and http success" do
      get "/client/"
      expect(response).to have_http_status(:ok)
    end
    end
  describe "POST /" do
    it "returns http created" do
      stub_name = Faker::name
      # Todo: use factory
      post "/client/", params: {name:stub_name}
      expect(response).to have_http_status(:created)
    end
  end

end
