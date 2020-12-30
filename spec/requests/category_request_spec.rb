require 'rails_helper'

RSpec.describe "Categories", type: :request do

  describe "GET /category" do
    before do
      FactoryBot.create(:category)
      FactoryBot.create(:category)
      get "/category/"
    end

    it "returns all category" do
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(2)
    end

    it "JSON body response contains expected recipe attributes" do
      json_response = JSON.parse(response.body)
      expect(json_response[0].keys).to match_array(['id', 'name', 'created_at', 'updated_at'])
    end
  end

end
