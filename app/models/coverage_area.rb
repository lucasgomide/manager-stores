# frozen_string_literal: true

class CoverageArea < Sequel::Model(:coverage_areas)
  def validate
    super
    validator = Validators::CoverageAreaValidator.new(self)
    unless validator.valid?
      validator.errors.each do |error|
        errors.add(error[:field], error[:message])
      end
    end
  end
end
