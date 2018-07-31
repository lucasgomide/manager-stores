# frozen_string_literal: true

require_relative '../geometry/converter'
class Address < Sequel::Model(:addresses)
  include Geometry::Converter

  def before_save
    self.coordinates = convert_to(coordinates, 'Point')
    super
  end

  def validate
    super
    validator = Validators::AddressValidator.new(self)
    add_errors(validator.errors) unless validator.valid?
  end

  private

  def add_errors(model_errors)
    model_errors.each do |error|
      errors.add(error[:field], error[:message])
    end
  end
end
