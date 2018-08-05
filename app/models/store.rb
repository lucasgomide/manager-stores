# frozen_string_literal: true

class Store < ApplicationRecord
  has_one :address, dependent: :destroy
  has_one :coverage_area, dependent: :destroy

  validates :document, :trading_name, :owner_name, presence: true
  validates :document, uniqueness: true

  scope :includes_association, -> { eager_load(:address, :coverage_area) }

  RADIUS_COVERAGE = 0

  def self.closest(lng, lat)
    order(
      Arel.sql(
        "ST_Distance(addresses.coordinates, ST_MakePoint(#{lng}, #{lat})::geography)"
      )
    )
  end

  def self.nearby(longitude, latitude)
    where(
      'ST_DWithin(coverage_areas.coordinates, ST_MakePoint(:lon, :lat)::geography, :radius)',
      lon: longitude, lat: latitude, radius: RADIUS_COVERAGE
    )
  end

  def self.search_closest_by(longitude, latitude)
    includes_association
      .nearby(longitude, latitude)
      .closest(longitude, latitude)
  end
end
