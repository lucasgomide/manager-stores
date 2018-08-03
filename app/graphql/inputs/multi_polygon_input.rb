# frozen_string_literal: true

module Inputs
  MultiPolygonInput = GraphQL::InputObjectType.define do
    name 'MultiPolygonInput'
    argument :coordinates, types[types[types[types[types.Int]]]]
  end
end
