# frozen_string_literal: true

class GraphqlController < ApplicationController
  def graphql
    variables = params[:variables]
    query = params[:query]
    render json: schema.execute(query, variables: JSON.parse(variables))
  rescue StandardError => e
    handle_error(e)
  end

  def schema
    @schema ||= Schema
  end
end
