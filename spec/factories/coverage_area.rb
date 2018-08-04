# frozen_string_literal: true

FactoryBot.define do
  factory :coverage_area do
    store { create(:store) }
    coordinates do
      [[[[40.0, 40.0], [20.0, 45.0], [45.0, 30.0], [40.0, 40.0]]], [[[21.142578125, 33.25399732319053], [10.0, 30.0], [6.396484375, 20.074580358450604], [10.0, 10.0], [30.0, 5.0], [45.0, 20.0], [21.142578125, 33.25399732319053]], [[20.0, 25.0], [20.0, 15.0], [30.0, 20.0], [20.0, 25.0]]]]
    end


    trait :invalid do
      coordinates [12, 23]
    end
  end
end
