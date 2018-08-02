class Store < ApplicationRecord
  has_one :address
  has_one :coverage_area

  validates_presence_of :document, :tranding_name, :owner_name
  validates :document, uniqueness: true
end
