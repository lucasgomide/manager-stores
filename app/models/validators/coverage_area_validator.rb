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
      unless GeometryType.multipolygon?(@coverage_area.coordinates)
        add_error(
          :coordinates,
          'coordinates must be a valid geometry MultiPolygon'
        )
      end
    end
  end
end
