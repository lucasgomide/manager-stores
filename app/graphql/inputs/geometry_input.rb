PointInput = GraphQL::InputObjectType.define do
  name "PointInput"
  argument :coordinates, types[types.Int]
end

MultiPolygonInput = GraphQL::InputObjectType.define do
  name "MultiPolygonInput"
  argument :coordinates, types[types[types[types[types.Int]]]]
end
