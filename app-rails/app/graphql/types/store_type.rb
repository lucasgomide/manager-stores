require_relative 'geometry_type'
module Types
  class StoreType < GraphQL::Schema::Object
    graphql_name "POS" # Point of sale
    description "A point of sale"

    global_id_field :id
    field :trandingName, String, "The POS' tranding name", hash_key: :tranding_name, null: false
    field :ownerName, String, "The POS' owner name", hash_key: :owner_name, null: false
    field :document, String, "The POS' document", null: false

    field :address, GeometryType, null: true
    field :coverageArea, GeometryType, null: true
  end
end
