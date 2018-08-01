require 'pry'
require_relative '../resolvers/store_resolver'
# type QueryType {
#   pdv: Resolvers::StoreResolver
# }
module Types
  class QueryType < GraphQL::Schema::Object
    graphql_name "Query"
    description "The query root for this schema"

    field :pdv, resolver: Resolvers::StoreResolver, null: true
  end
end
