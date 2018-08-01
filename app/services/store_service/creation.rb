require_relative '../../models/store'
require_relative '../../models/address'
require_relative '../../models/coverage_area'
module Services
  module StoreService
    class Creation
      def call(args)
        # TODO: Use transaction database
        store = Store.create(
          tranding_name: args.tranding_name,
          owner_name: args.owner_name,
          document: args.document,
        )
        Address.create(
          store: store,
          coordinates: args.address.coordinates
        )
        CoverageArea.create(
          store: store,
          coordinates: args.coverage_area.coordinates
        )
        store
      end
    end
  end
end
