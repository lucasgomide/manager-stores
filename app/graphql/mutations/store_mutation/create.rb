# frozen_string_literal: true

module Mutations
  module StoreMutation
    class Create
      def call(_obj, args, _ctx)
        ::Services::StoreService::Creation.new.call(args)
      rescue StandardError => error
        GraphQL::ExecutionError.new(error.message)
      end
    end
  end
end
