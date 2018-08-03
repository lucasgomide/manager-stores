module Types
  class QueryType < GraphQL::Schema::Object
    graphql_name "Query"
    description "The query root for this schema"

    field :pdv, resolver: Resolvers::StoreResolver, null: true
    field :search, resolver: Resolvers::SearchResolver, null: true
  end
end
