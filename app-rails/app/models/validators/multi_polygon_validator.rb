# frozen_string_literal: true
module Validators
  class MultiPolygonValidator
    include Validator

    def initialize(coverage_area, geometry_validator = Geometry::Validator)
      @coverage_area = coverage_area
      @geometry_validator = geometry_validator
    end

    def valid?
      validate
      errors.empty?
    end

    private

    def validate
      message_error = 'must be a valid geometry object (MultiPolygon)'
      coordinates = @coverage_area.coordinates
      add_error(:coordinates, message_error) unless @geometry_validator.multipolygon?(coordinates)
    end
  end
end
