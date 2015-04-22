require 'rails_helper'

RSpec.describe Api::ItemsController, type: :controller do

  describe "Items#create" do

    it "creates item" do
      allow(controller).to receive(:authenticated?)
      post :create, :list_id => "1", item: { description: "this is an item" }
      # assert_equal 201, response.status
      expect(response).to be_success
      assert_equal Mime::JSON, response.content_type
    end

    it "fails without authentication" do
      post :create, :list_id => "1", item: { description: "this is an item" }
      expect(response).to_not be_success
    end
  end
end