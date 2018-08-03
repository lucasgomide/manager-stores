# frozen_string_literal: true
module Validators
  class PointValidator
    include Validator

    def initialize(point, geometry_validator = Geometry::Validator)
      @point = point
      @geometry_validator = geometry_validator
    end

    def valid?
      validate
      errors.empty?
    end

    private

    def validate
      message_error = 'must be a valid geometry object (Point)'
      coordinates = @point.coordinates
      add_error(:coordinates, message_error) unless @geometry_validator.point?(coordinates)
    end
  end
end
