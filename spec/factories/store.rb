# frozen_string_literal: true

FactoryBot.define do
  factory :store do
    trading_name 'Store #1'
    owner_name 'Malé'
    document '12394'

    trait :with_address_and_coverage do
      after(:create) do |store|
        create(:address, store: store)
        create(:coverage_area, store: store)
      end
    end
  end
end
