# frozen_string_literal: true

class ApplicationController < ActionController::API
  protected

  def handle_error(error)
    logger.error error.message
    logger.error error.backtrace.join("\n")

    render json: {
      error: { message: error.message, backtrace: error.backtrace },
      data: {}
    }, status: :internal_server_error
  end
end
