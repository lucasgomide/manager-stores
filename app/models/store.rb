# frozen_string_literal: true

# Store is a model that represents each store on database
class Store < Sequel::Model(:stores)
  plugin :validation_helpers
  one_to_many :coverage_areas
  one_to_many :addresses, class_name: Address

  def validate
    validates_presence %i[tranding_name owner_name document]
    validates_unique(:document)
  end
end
