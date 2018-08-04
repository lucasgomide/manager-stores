# frozen_string_literal: true

module Types
  class MutationType < GraphQL::Schema::Object
    field :createPDV, Types::StoreType, null: false, resolve: Mutations::StoreMutation::Create.new do
      argument :tradingName, String, required: true
      argument :owner_name, String, required: true
      argument :document, String, required: true
      argument :address, Inputs::PointInput, required: true
      argument :coverageArea, Inputs::MultiPolygonInput, required: true
    end
  end
end
