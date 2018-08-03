class Address < ApplicationRecord
  include Geojsonable

  belongs_to :store

  GEOMETRY_TYPE = 'Point'.freeze
end
