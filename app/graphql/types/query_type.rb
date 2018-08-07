# frozen_string_literal: true

module Types
  class QueryType < GraphQL::Schema::Object
    graphql_name 'Query'
    description 'The query root for this schema'

    field :getPDV, resolver: Resolvers::StoreResolver, null: true
    field :searchClosestPDV, resolver: Resolvers::SearchResolver, null: true
  end
end
