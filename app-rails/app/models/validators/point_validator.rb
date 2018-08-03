# frozen_string_literal: true
module Validators
  class PointValidator
    include Validator

    def initialize(address, geometry_validator = Geometry::Validator)
      @address = address
      @geometry_validator = geometry_validator
    end

    def valid?
      validate
      errors.empty?
    end

    private

    def validate
      message_error = 'must be a valid geometry object (Point)'
      # Postgis-adpter raises an exception as long as coordinates is not a valid object Point. So no longer custom validation is required.
      return true if @address.coordinates
    rescue => error
      add_error(:coordinates, message_error)
    end
  end
end
