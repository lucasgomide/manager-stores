# frozen_string_literal: true

require_relative 'validator'
module Validators
  class CoverageAreaValidator
    include Validator

    def initialize(coverage_area)
      @coverage_area = coverage_area
    end

    def valid?
      validate
      errors.empty?
    end

    private

    def validate
      message_error = 'coordinates must be a valid geometry MultiPolygon'
      coordinates = @coverage_area.coordinates
      add_error(:coordinates, message_error) unless GeometryType.multipolygon?(coordinates)
    end
  end
end
