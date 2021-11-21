class ApplicationController < ActionController::API

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_bad_request
  rescue_from ActiveRecord::StatementInvalid, with: :render_invalid_statement
  rescue_from Exceptions::InvalidParams, with: :render_bad_request

  def object_serializer(serializer_klass, *args)
    serializer_klass.new(*args)
  end

  private

  def render_not_found(exception)
    render json: {
      error: {
        message: exception.message
      }
    }, status: :not_found
  end

  def render_bad_request(exception)
    render json: {
      error: {
        message: exception.message
      }
    }, status: :bad_request
  end

  def render_invalid_statement(exception)
    render json: {
      error: {
        message: 'Unidentified attribute Entered'
      }
    }, status: :bad_request
  end
end
