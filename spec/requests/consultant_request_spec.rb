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
      expect(json_response[0].keys).to match_array(['id', 'name','rating', 'created_at', 'updated_at'])
    end
  end

end
