# frozen_string_literal: true

class Address < Sequel::Model(:addresses)
  def validate
    super
    validator = Validators::AddressValidator.new(self)
    unless validator.valid?
      validator.errors.each do |error|
        errors.add(error[:field], error[:message])
      end
    end
  end
end
