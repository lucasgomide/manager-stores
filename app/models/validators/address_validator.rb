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
      unless GeometryType.point?(@address.coordinates)
        add_error(
          :coordinates,
          'coordinates must be a valid geometry Point'
        )
      end
    end
  end
end
