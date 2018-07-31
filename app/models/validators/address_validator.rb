# frozen_string_literal: true

require_relative 'validator'
module Validators
  class AddressValidator
    include Validator

    def initialize(address)
      @address = address
    end

    def valid?
      validate
      errors.empty?
    end

    private

    def validate
      message_error = 'coordinates must be a valid geometry Point'
      coordinates = @address.coordinates
      add_error(:coordinates, message_error) unless GeometryType.point?(coordinates)
    end
  end
end
