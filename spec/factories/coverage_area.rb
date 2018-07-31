# frozen_string_literal: true

FactoryBot.define do
  factory :coverage_area do
    coordinates [[[[10, 23]]]]
    store { build(:store).save }
  end
end
