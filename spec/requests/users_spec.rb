require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }

  describe "GET /users" do
    before do
      create(:user)
      get "/users", headers: { accept: "application/json" }
    end

    it "status code" do
      expect(response).to have_http_status(:ok)
    end

    it "content type" do
      expect(response.content_type).to eq('application/json')
    end

    it "payload" do
      json_count = JSON.parse(body).count
      expect(json_count).to eq(User.count)
    end
  end

  describe "GET /users/:id" do
    before do
      get "/users/#{user.id}", headers: { accept: "application/json" }
    end

    it "status code" do
      expect(response).to have_http_status(:ok)
    end

    it "content type" do
      expect(response.content_type).to eq('application/json')
    end

    it "payload" do
      user_id = JSON.parse(body)["id"]
      expect(user_id).to eq(user.id)
    end

    context "missing person" do
      it "not found" do
        not_found = rand(199..999)
        get "/users/#{not_found}", headers: { accept: "application/json" }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "POST /users" do
    let(:user) { build(:user) }
    let(:params) { { user: {
                            name: user.name,
                            email: user.email,
                            dob: user.dob
                 } }       }

    before do
      post "/users", { params: params, headers: { accept: "application/json" } }
    end

    it "status code" do
      expect(response).to have_http_status(:created)
    end

    it "content type" do
      expect(response.content_type).to eq('application/json')
    end

    it "payload" do
      expect(user.name).to eq(User.last.name)
    end
  end

  describe "DELETE /users/:id" do
    before do
      delete "/users/#{user.id}", { headers: { accept: "application/json" } }
    end

    it "status code" do
      expect(response).to have_http_status(:no_content)
    end

    it "content type" do
      expect(response.content_type).to be_nil
    end
  end
end
