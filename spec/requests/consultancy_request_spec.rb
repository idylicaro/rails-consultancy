require 'rails_helper'

RSpec.describe "Consultancies", type: :request do

  describe "GET /consultancy" do
    before do
      client1 = FactoryBot.create(:client)
      consultant1 = FactoryBot.create(:consultant)
      client2 = FactoryBot.create(:client)
      consultant2 = FactoryBot.create(:consultant)
      Consultancy.create(client:client1, consultant:consultant1,rating:0)
      Consultancy.create(client_id:client2.id, consultant_id:consultant2.id,rating:0)
      get "/consultancy/"
    end

    it "returns all consultants" do
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(2)
    end

    it "JSON body response contains expected recipe attributes" do
      json_response = JSON.parse(response.body)
      expect(json_response[0].keys).to match_array(['client_id', 'consultant_id', 'created_at', 'end_date', 'id', 'rating', 'start_date', 'updated_at'])
    end
  end

end
