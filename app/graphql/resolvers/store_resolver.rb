# frozen_string_literal: true

module Resolvers
  class StoreResolver < GraphQL::Schema::Resolver
    type Types::StoreType, null: false

    argument :id, Int, required: false

    def resolve(id:)
      Store.includes_association.find_by(id: id)
    end
  end
end
