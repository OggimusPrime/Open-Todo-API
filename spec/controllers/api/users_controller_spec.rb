require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do

  describe "Users#index returns all users" do

    it 'success with authentication' do
      allow(controller).to receive(:authenticated?)
      get :index
      assert_equal 200, response.status
      assert_equal Mime::JSON, response.content_type
    end

    it "fails without authentication" do
      get :index
      assert_equal 401, response.status
    end
  end

  describe "Users#create" do

    it "creates user" do
      allow(controller).to receive(:authenticated?)
      post :create, user: { username: 'Bob', password: 'bobtest' }
      assert_equal 201, response.status
      # expect(response).to be_success
      assert_equal Mime::JSON, response.content_type
    end

    it "fails without authentication" do
      post :create, user: { username: 'Bob', password: 'bobtest' }
      assert_equal 401, response.status
    end

    it "fails with missing password" do
      allow(controller).to receive(:authenticated?)
      post :create, user: { username: 'Bob' }
      assert_equal 422, response.status
    end
  end

  describe "Users#destroy" do

    before do
      @user = create(:user)
    end

    it "deletes existing user" do
      allow(controller).to receive(:authenticated?)
      delete :destroy, { id: @user.id }
      assert_equal 204, response.status
    end
  end
end
