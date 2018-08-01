# frozen_string_literal: true

require_relative '../geometry/converter'
class Address < Sequel::Model(:addresses)
  include Geometry::Converter

  many_to_one :store

  GEOMETRY_TYPE = 'Point'.freeze

  def before_save
    self.coordinates = encode_geojson!(coordinates, GEOMETRY_TYPE)
    super
  end
  private

  def validate
    super
    validator = Validators::AddressValidator.new(self)
    add_errors(validator.errors) unless validator.valid?
  end

  def add_errors(model_errors)
    model_errors.each do |error|
      errors.add(error[:field], error[:message])
    end
  end
end
