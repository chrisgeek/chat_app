class SerializableMessage < JSONAPI::Serializable::Resource
  type 'messages'

  attributes :body
end
