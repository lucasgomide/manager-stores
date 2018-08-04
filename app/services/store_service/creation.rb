# frozen_string_literal: true

module Services
  module StoreService
    class Creation
      def call(args)
        ActiveRecord::Base.transaction do
          store = Store.create!(
            trading_name: args.trading_name,
            owner_name: args.owner_name,
            document: args.document
          )
          store.create_address!(
            coordinates: args.address.coordinates
          )
          store.create_coverage_area!(
            coordinates: args.coverage_area.coordinates
          )
          store
        end
      end
    end
  end
end
