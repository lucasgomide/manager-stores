# frozen_string_literal: true

FactoryBot.define do
  factory :coverage_area do
    coordinates [[[[10, 23]]]]
    store { create(:store) }

    trait :invalid do
      coordinates [12, 23]
    end
  end
end
