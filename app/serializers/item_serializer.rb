class ItemSerializer < ActiveModel::Serializer
  attributes :id, :description

  def description
    object.description
  end
end
