# frozen_string_literal: true

class GraphqlController < ApplicationController
  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    result = Schema.execute(query, variables: variables)
    render json: result
  rescue StandardError => e
    raise e unless Rails.env.development?
    handle_error_in_development e
  end

  private

  # Handle form data, JSON body, or a blank value
  def ensure_hash(params)
    case params
    when String
      if params.present?
        ensure_hash(JSON.parse(params))
      else
        {}
      end
    when Hash, ActionController::Parameters
      params
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{params}"
    end
  end

  def handle_error_in_development(error)
    logger.error error.message
    logger.error error.backtrace.join("\n")

    render json: {
      error: { message: error.message, backtrace: error.backtrace },
      data: {}
    }, status: :internal_server_error
  end
end
