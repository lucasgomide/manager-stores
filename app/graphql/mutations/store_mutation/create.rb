module Mutations
  module StoreMutation
    class Create
      def call(obj, args, ctx)
        ::Services::StoreService::Creation.new.call(args)
      rescue => error
        GraphQL::ExecutionError.new(error.message)
      end
    end
  end
end
