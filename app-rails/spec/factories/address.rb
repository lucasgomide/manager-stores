# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    coordinates [10, 20]
    store { create(:store) }

    trait :invalid do
      coordinates [[12, 12]]
    end
  end
end
