# frozen_string_literal: true

FactoryBot.define do
  factory :coverage_area do
    coordinates [[[[10, 23]]]]
    store { create(:store) }
  end
end
