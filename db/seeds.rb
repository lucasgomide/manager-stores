# frozen_string_literal: true

stores = JSON.parse(
  File.read(Rails.root.join('db', 'stores-sample-data.json'))
)

stores['pdvs'].each do |pdv|
  ActiveRecord::Base.transaction do
    store = Store.new(
      trading_name: pdv['tradingName'],
      owner_name: pdv['ownerName'],
      document: pdv['document']
    )
    store.address = Address.new(
      coordinates: pdv['address']['coordinates']
    )
    store.coverage_area = CoverageArea.new(
      coordinates: pdv['coverageArea']['coordinates']
    )
    store.save
  end
end
