# frozen_string_literal: true

# Store is a model that represents each store on database
class Store < Sequel::Model(:stores)
  one_to_many :coverage_areas
  one_to_many :addresses, class_name: Address
end
