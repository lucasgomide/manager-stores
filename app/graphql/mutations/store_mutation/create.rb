# frozen_string_literal: true

module Mutations
  module StoreMutation
    class Create
      def initialize(
        creation_service = Services::StoreService::Creation.new,
        graphql_error = GraphQL::ExecutionError
      )
        @creation_service = creation_service
        @graphql_error = graphql_error
      end

      def call(_obj, args, _ctx)
        @creation_service.call(args)
      rescue StandardError => error
        @graphql_error.new(error.message)
      end
    end
  end
end
