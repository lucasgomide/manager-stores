# frozen_string_literal: true

class Address < ApplicationRecord
  include Geojsonable

  belongs_to :store

  GEOMETRY_TYPE = 'Point'
end
