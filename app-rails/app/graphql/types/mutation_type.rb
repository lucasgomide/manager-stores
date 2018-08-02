require 'pry'
require_relative '../mutations/store_mutation/create.rb'
require_relative '../types/store_type'
require_relative '../inputs/geometry_input'
# require_relative '../inputs/geometry_input'
# type QueryType {
#   pdv: Resolvers::StoreResolver
# }

class Types::MutationType < GraphQL::Schema::Object
  field :createStore, Types::StoreType, null: false, resolve: Mutations::StoreMutation::Create.new do
    argument :trandingName, String, required: true
    argument :owner_name, String, required: true
    argument :document, String, required: true
    argument :address, PointInput, required: true
    argument :coverageArea, MultiPolygonInput, required: true
  end
end
