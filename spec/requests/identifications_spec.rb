require 'rails_helper'

RSpec.describe "Identifications", type: :request do
  let!(:user) { create(:user) }
  let(:user_with_identification) { create(:user, :with_identification) }
  subject { create(:identification) }

  describe "GET /identifications" do
    before do
      get "/identifications", headers: { accept: "application/json" }
    end

    it "status code" do
      expect(response).to have_http_status(:ok)
    end

    it "content type" do
      expect(response.content_type).to eq('application/json')
    end

    it "payload" do
      json_count = JSON.parse(body).count
      expect(json_count).to eq(Identification.count)
    end
  end

  describe "GET /users/:id/identification" do
    before do
      get "/users/#{user.id}/identification", headers: { accept: "application/json" }
    end

    it "status code" do
      expect(response).to have_http_status(:ok)
    end

    it "content type" do
      expect(response.content_type).to eq('application/json')
    end

    it "payload" do
      expect(subject.number).to eq(Identification.last.number)
    end
  end

  describe "POST /users/:id/identification" do
    let(:params) { { identification: {
      user_id: user.id,
      number: subject.number,
      state: subject.state,
      expiration: subject.expiration,
    } } }

    before do
      post "/users/#{user.id}/identification", { params: params, headers: { accept: "application/json" } }
    end

    it "status code" do
      expect(response).to have_http_status(:created)
    end

    it "content type" do
      expect(response.content_type).to eq('application/json')
    end

    it "payload" do
      expect(subject.number).to eq(Identification.last.number)
    end
  end


  describe "PATCH /users/:id/identification" do
    let(:params) { { identification: {
      number: 'n3w numb3r',
    } } }

    before do
      patch "/users/#{user_with_identification.id}/identification", { params: params, headers: { accept: "application/json" } }
    end

    it "status code" do
      expect(response).to have_http_status(:ok)
    end

    it "content type" do
      expect(response.content_type).to eq('application/json')
    end

    it "payload" do
      expect(subject.number).to eq(Identification.last.number)
    end
  end

  describe "DELETE /users/:id/identification" do
    before do
      delete "/users/#{user_with_identification.id}/identification", { headers: { accept: "application/json" } }
    end

    it "status code" do
      expect(response).to have_http_status(:no_content)
    end

    it "content type" do
      expect(response.content_type).to be_nil
    end
  end
end
