require 'rails_helper'

RSpec.describe UserSerializer, :type => :serializer do

  describe 'User Representation' do
    let(:user) { @user = create(:user) }
    let(:serializer) { UserSerializer.new(user) }
    let(:serialization) { ActiveModel::Serializer::Adapter.create(serializer) }

    subject do
      serialization.to_json
    end

    it 'foo' do
      response_attributes = user.attributes.slice *%w(
        id
        email
      )
      expect(JSON.parse(subject)).to eq(response_attributes)
    end

    #it 'returns a json object for the user' do
      #expect(subject).to be_a_user_representation_of(user)
    #end
  end
end
