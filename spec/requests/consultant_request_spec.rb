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

  describe "POST /consultant" do
    it "returns http created" do
      stub_name = Faker::name
      post "/consultant/", params: {name:stub_name}
      expect(response).to have_http_status(:created)
    end
    it "return a consultant created" do
      stub_name = Faker::name
      expect{
        post "/consultant/", params: {name:stub_name}
      }.to change { Consultant.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe "DELETE /consultant/:id" do
    let!(:consultant) { FactoryBot.create(:consultant) }

    it "delete a client and return http ok" do
      expect{
        delete "/consultant/#{consultant.id}"
      }.to change { Consultant.count }.from(1).to(0)

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
      expect(Consultant.count).to eq(1)
      expect(response).to have_http_status(:ok)
    end
  end

end
