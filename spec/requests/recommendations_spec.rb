require 'rails_helper'

RSpec.describe "Recommendations", type: :request do
  let!(:user) { create(:user) }
  let(:user_with_recommendation) { create(:user, :with_recomendation) }
  subject { create(:recommendation) }

  describe "GET /recommendations" do
    before do
      get "/recommendations", headers: { accept: "application/json" }
    end

    it "status code" do
      expect(response).to have_http_status(:ok)
    end

    it "content type" do
      expect(response.content_type).to eq('application/json')
    end

    it "payload" do
      json_count = JSON.parse(body).count
      expect(json_count).to eq(Recommendation.count)
    end
  end

  describe "GET /users/:id/recommendation" do
    before do
      get "/users/#{user.id}/recommendation", headers: { accept: "application/json" }
    end

    it "status code" do
      expect(response).to have_http_status(:ok)
    end

    it "content type" do
      expect(response.content_type).to eq('application/json')
    end

    it "payload" do
      expect(subject.issuer).to eq(Recommendation.last.issuer)
    end
  end

  describe "POST /users/:id/recommendation" do
    let(:params) { { recommendation: {
      user_id: user.id,
      number: subject.number,
      issuer: subject.issuer,
      state: subject.state,
      expiration: subject.expiration,
    } } }

    before do
      post "/users/#{user.id}/recommendation", { params: params, headers: { accept: "application/json" } }
    end

    it "status code" do
      expect(response).to have_http_status(:created)
    end

    it "content type" do
      expect(response.content_type).to eq('application/json')
    end

    it "payload" do
      expect(subject.issuer).to eq(Recommendation.last.issuer)
    end
  end


  describe "PATCH /users/:id/recommendation" do
    let(:params) { { recommendation: {
      number: 'n3w numb3r',
    } } }

    before do
      patch "/users/#{user_with_recommendation.id}/recommendation", { params: params, headers: { accept: "application/json" } }
    end

    it "status code" do
      expect(response).to have_http_status(:ok)
    end

    it "content type" do
      expect(response.content_type).to eq('application/json')
    end

    it "payload" do
      expect(subject.issuer).to eq(Recommendation.last.issuer)
    end
  end

  describe "DELETE /users/:id/recommendation" do
    before do
      delete "/users/#{user_with_recommendation.id}/recommendation", { headers: { accept: "application/json" } }
    end

    it "status code" do
      expect(response).to have_http_status(:no_content)
    end

    it "content type" do
      expect(response.content_type).to be_nil
    end
  end
end
