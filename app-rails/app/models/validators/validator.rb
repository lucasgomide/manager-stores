# frozen_string_literal: true

module Validators::Validator
  def add_error(field, message)
    errors << { field: field, message: message }
  end

  def errors
    @errors ||= []
  end
end
