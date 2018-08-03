# frozen_string_literal: true

FactoryBot.define do
  factory :store do
    tranding_name 'Store #1'
    owner_name 'Malé'
    document '12394'
    coverage_area { create(:coverage_area) }
    address { create(:address) }
  end
end
