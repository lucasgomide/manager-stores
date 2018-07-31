# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    coordinates [10, 20]
    store { build(:store).save }
  end
end
