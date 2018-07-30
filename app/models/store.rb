class Store  < Sequel::Model(:stores)
  one_to_many :coverage_areas
  one_to_many :addresses, class_name: Address
end
