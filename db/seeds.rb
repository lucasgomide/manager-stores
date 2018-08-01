# frozen_string_literal: true

require File.expand_path('../config/boot', __dir__)
set :database, Application.configuration.database.url

files = Dir.glob(File.join(Application.root, 'app', '**', '**', '*rb'))
files.each { |file| require file }

stores = JSON.parse(File.read('./db/stores-sample-data.json'))

stores['pdvs'].each do |pdv|
  database.transaction do
    store = Store.create(
      tranding_name: pdv['tradingName'],
      owner_name: pdv['ownerName'],
      document: pdv['document']
    )

    Address.create(
      coordinates: pdv['address']['coordinates'],
      store: store
    )

    CoverageArea.create(
      coordinates: pdv['coverageArea']['coordinates'],
      store: store
    )
  end
end
