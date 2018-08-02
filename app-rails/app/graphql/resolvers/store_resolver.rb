require_relative '../types/store_type'
module Resolvers
  class StoreResolver < GraphQL::Schema::Resolver
    type Types::StoreType, null: false

    argument :id, Int, required: false

    def resolve(id)
      # TODO: Refactor it to not use dataset
      CoverageArea.set_dataset(
        CoverageArea.dataset.select_append{st_astext(:coordinates).as(:coordinates)}
      )
      Store[id]
    end
  end
end
