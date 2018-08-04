# frozen_string_literal: true

module Types
  class AddressType < GraphQL::Schema::Object
    global_id_field :id
    field :type, String, null: false
    field :coordinates, [Float], null: false, method: :coordinates_to_a
  end
end
