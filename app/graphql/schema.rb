require 'pry'
require_relative 'types/query_type'
class Schema < GraphQL::Schema
  query Types::QueryType

  def id_from_object(object, type_definition, ctx)
    GraphQL::Schema::UniqueWithinType.encode(
      type_definition.name, object.id
    )
  end
end
