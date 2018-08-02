module Services
  module StoreService
    class Creation
      def call(args)
        ActiveRecord::Base.transactions do
          store = Store.create!(
            tranding_name: args.tranding_name,
            owner_name: args.owner_name,
            document: args.document,
          )
          store.address = Address.create!(
            coordinates: args.address.coordinates
          )
          store.coverage_address = CoverageArea.create!(
            coordinates: args.coverage_area.coordinates
          )
          store
        end
      end
    end
  end
end
