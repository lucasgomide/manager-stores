# frozen_string_literal: true

module Types
  class StoreType < GraphQL::Schema::Object
    graphql_name 'PDV' # Point of sale
    description 'A point of sale'

    global_id_field :id
    field :tradingName, String, "The PDV' tranding name", hash_key: :trading_name, null: false
    field :ownerName, String, "The PDV' owner name", hash_key: :owner_name, null: false
    field :document, String, "The PDV' document", null: false

    field :address, Types::AddressType, null: false
    field :coverageArea, Types::CoverageAreaType, null: false
  end
end
