# frozen_string_literal: true

require File.expand_path('../config/boot', __dir__)
set :database, Application.configuration.database.url

require File.expand_path('../app/model', __dir__)

stores = JSON.parse(File.read('./db/stores-sample-data.json'))

stores['pdvs'].each do |pdv|
  store = Store.create(
    tranding_name: pdv['tradingName'],
    owner_name: pdv['ownerName'],
    document: pdv['document']
  )
  store.add_address(
    coordinates: RGeo::GeoJSON.decode(pdv['address']).to_s
  )

  store.add_coverage_area(
    coordinates: RGeo::GeoJSON.decode(pdv['coverageArea']).to_s
  )
end
