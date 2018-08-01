module Mutations
  module StoreMutation
    class Create
      def call(obj, args, ctx)
        Services::StoreService::Creation.new.call(args)
      rescue Sequel::ValidationFailed => error
        GraphQL::ExecutionError.new(error.message)
      end
    end
  end
end
