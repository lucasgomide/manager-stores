# frozen_string_literal: true

require_relative 'validator'

module Validators
  class CoverageAreaValidator
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
      message_error = 'must be a valid geometry MultiPolygon'
      coordinates = @coverage_area.coordinates
      add_error(:coordinates, message_error) unless @geometry_validator.multipolygon?(coordinates)
    end
  end
end
