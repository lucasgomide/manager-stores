# frozen_string_literal: true

require_relative '../geometry/converter'
require 'pry'
class CoverageArea < Sequel::Model(:coverage_areas)
  include Geometry::Converter
  many_to_one :store

  GEOMETRY_TYPE = 'MultiPolygon'.freeze

  def before_create
    self.coordinates = encode_geojson!(values[:coordinates], GEOMETRY_TYPE)
    super
  end

  def coordinates
    return values[:coordinates] if values[:coordinates].is_a?(Array)
    cartesian_factory = RGeo::Cartesian.preferred_factory
    RGeo::GeoJSON.encode(cartesian_factory.parse_wkt(values[:coordinates]))['coordinates']
  end

  private

  def validate
    super
    validator = Validators::CoverageAreaValidator.new(self)
    add_errors(validator.errors) unless validator.valid?
  end

  def add_errors(model_errors)
    model_errors.each do |error|
      errors.add(error[:field], error[:message])
    end
  end
end
