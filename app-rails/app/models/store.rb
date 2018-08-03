class Store < ApplicationRecord
  has_one :address
  has_one :coverage_area

  validates_presence_of :document, :tranding_name, :owner_name
  validates :document, uniqueness: true

  scope :includes_association, ->{ eager_load(:address, :coverage_area) }
  scope :closest, ->(lng, lat) { order("ST_Distance(addresses.coordinates, ST_MakePoint(#{lng}, #{lat})::geography)") }
  scope :nearby, ->(longitude, latitude, distance: 3000) do
    where("ST_DWithin(coverage_areas.coordinates, ST_MakePoint(:lon, :lat)::geography, :distance)", lon: longitude, lat: latitude, distance: distance)
  end

  def self.search_closest_by(longitude, latitude)
    includes_association
      .nearby(longitude, latitude)
      .closest(longitude, latitude)
  end
end
