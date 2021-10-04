class SerializableGroup < JSONAPI::Serializable::Resource
  type 'groups'

  attributes :name, :description
end
