# frozen_string_literal: true

require_relative '../geometry/converter'

class CoverageArea < Sequel::Model(:coverage_areas)
  include Geometry::Converter

  def before_save
    self.coordinates = convert_to(coordinates, 'MultiPolygon')
    super
  end

  def validate
    super
    validator = Validators::CoverageAreaValidator.new(self)
    add_errors(validator.errors) unless validator.valid?
  end

  private

  def add_errors(model_errors)
    model_errors.each do |error|
      errors.add(error[:field], error[:message])
    end
  end
end
