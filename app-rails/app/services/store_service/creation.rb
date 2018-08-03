module Services
  module StoreService
    class Creation
      def call(args)
        ActiveRecord::Base.transaction do
          store = Store.new(
            tranding_name: args.tranding_name,
            owner_name: args.owner_name,
            document: args.document,
          )
          store.address = Address.new(
            coordinates: args.address.coordinates
          )
          store.coverage_area = CoverageArea.new(
            coordinates: args.coverage_area.coordinates
          )
          store.save!
          store
        end
      end
    end
  end
end
