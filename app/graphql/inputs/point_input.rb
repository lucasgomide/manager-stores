# frozen_string_literal: true

module Inputs
  PointInput = GraphQL::InputObjectType.define do
    name 'PointInput'
    argument :coordinates, types[types.Float]
  end
end
