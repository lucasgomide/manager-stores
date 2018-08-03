module Types
  class GeometryType < GraphQL::Schema::Object
    global_id_field :id
    field :type, String, null: false
    field :coordinates, String, null: false
  end
end
