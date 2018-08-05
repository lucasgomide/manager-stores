# frozen_string_literal: true

class Schema < GraphQL::Schema
  use GraphQL::Tracing::NewRelicTracing
  query Types::QueryType
  mutation Types::MutationType

  def id_from_object(object, type_definition, _ctx)
    GraphQL::Schema::UniqueWithinType.encode(
      type_definition.name, object.id
    )
  end
end
