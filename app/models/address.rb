# frozen_string_literal: true

class Address < Sequel::Model(:addresses)
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
