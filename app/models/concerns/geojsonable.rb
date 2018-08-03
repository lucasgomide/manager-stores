# frozen_string_literal: true

module Geojsonable
  extend ActiveSupport::Concern

  included do
    before_save :encode_coordinates!
    validate :validate_geometry_object
  end

  def encode_coordinates!
    geo = {
      type: self.class::GEOMETRY_TYPE,
      coordinates: attributes['coordinates']
    }

    self.coordinates = RGeo::GeoJSON.decode(geo.to_json).to_s
  end

  def validate_geometry_object
    validator = "Validators::#{self.class::GEOMETRY_TYPE}Validator".constantize.new(self)
    add_errors(validator.errors) unless validator.valid?
  end

  def add_errors(model_errors)
    model_errors.each do |error|
      errors.add(error[:field], error[:message])
    end
  end
end
