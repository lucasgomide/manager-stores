# frozen_string_literal: true

class CoverageArea < ApplicationRecord
  include Geojsonable

  belongs_to :store

  GEOMETRY_TYPE = 'MultiPolygon'
end
