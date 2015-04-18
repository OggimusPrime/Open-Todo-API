require 'rails_helper'

RSpec.describe UserSerializer, :type => :serializer do 

  describe 'User Representation' do
    let(:user) { @user = create(:user) }

    let(:serializer) { UserSerializer.new(:user) }
    let(:serialization) { ActiveModel::Serializer::Adapter.create(serializer) }

    subject do
      JSON.parse(serialization.to_json)['user']
    end

    it 'has a username' do
      expect(subject).to be_a_user_representation(user)
    end
  end
end

# describe UserSerializer do
#   let(:user) { build :user, id: 1, password: 'token' }
#   let(:json) { UserSerializer.new(user).to_json }
#   let(:user_json) { parse_json(json)['user'] }

#   it 'returns user' do
#     expect(user_json).to be_a_user_representation(user)
#   end
# end