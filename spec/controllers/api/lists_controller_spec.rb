require 'rails_helper'

RSpec.describe Api::ListsController, type: :controller do

  describe "Lists#create" do

    before do
      @user = create(:user)
    end

    it "creates list" do
      allow(controller).to receive(:authenticated?)
      post :create, :user_id => @user.id, list: { name: "list", permissions: "public" }
      assert_equal 201, response.status
      # expect(response).to be_success
      assert_equal Mime::JSON, response.content_type
    end

    it "fails without authentication" do
      post :create, :user_id => @user.id, list: { name: "list", permissions: "public" }
      expect(response).to_not be_success
    end
  end
end