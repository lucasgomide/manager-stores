# frozen_string_literal: true

# Store is a model that represents each store on database
class Store < Sequel::Model(:stores)
  plugin :validation_helpers
  one_to_one :coverage_area
  one_to_one :address

  def validate
    validates_presence %i[tranding_name owner_name document]
    validates_unique(:document)
  end

  def self.search_closest_by(lng, lat)
    association_join(:address, :coverage_area)
      .where(
        Sequel.lit("ST_DWithin(coverage_area.coordinates, ST_MakePoint(?, ?)::geography, 4000)", lng, lat)
      )
      .order(
        Sequel.lit("ST_Distance(address.coordinates, ST_MakePoint(?, ?)::geography)",
        lng, lat)
      ).all
  end
end
