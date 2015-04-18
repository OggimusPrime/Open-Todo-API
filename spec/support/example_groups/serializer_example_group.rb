module SerializerExampleGroup
  extend ActiveSupport::Concern

  RSpec.configure do |config|
    config.include self, 
    :type => :serializer,
    :example_group => { :file_apath => %r(spec/serializers) }
  end
end