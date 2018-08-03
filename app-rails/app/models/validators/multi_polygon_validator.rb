# frozen_string_literal: true
module Validators
  class MultiPolygonValidator
    include Validator

    def initialize(multipolygon, geometry_validator = Geometry::Validator)
      @multipolygon = multipolygon
      @geometry_validator = geometry_validator
    end

    def valid?
      validate
      errors.empty?
    end

    private

    def validate
      message_error = 'must be a valid geometry object (MultiPolygon)'
      coordinates = @multipolygon.coordinates
      add_error(:coordinates, message_error) unless @geometry_validator.multipolygon?(coordinates)
    end
  end
end
