# frozen_string_literal: true

module Resolvers
  class SearchResolver < GraphQL::Schema::Resolver
    type [Types::StoreType], null: false

    argument :lng, Float, required: false
    argument :lat, Float, required: false

    def resolve(lng:, lat:)
      Store.search_closest_by(lng, lat)
    end
  end
end
