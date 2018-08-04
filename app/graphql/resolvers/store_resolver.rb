# frozen_string_literal: true

module Resolvers
  class StoreResolver < GraphQL::Schema::Resolver
    type Types::StoreType, null: false

    argument :id, Int, required: false

    def resolve(id:)
      Store.eager_load(:address, :coverage_area).find_by(id: id)
    end
  end
end
