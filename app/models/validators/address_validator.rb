# frozen_string_literal: true

require_relative 'validator'

module Validators
  class AddressValidator
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
      message_error = 'must be a valid geometry Point'
      coordinates = @address.coordinates
      add_error(:coordinates, message_error) unless @geometry_validator.point?(coordinates)
    end
  end
end
