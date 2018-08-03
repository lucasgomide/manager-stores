class CoverageArea < ApplicationRecord
  include Geojsonable

  belongs_to :store

  GEOMETRY_TYPE = 'MultiPolygon'.freeze

  def encode_coordinates?
    true
  end
end
