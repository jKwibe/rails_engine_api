class ApplicationController < ActionController::API

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_active_record_failure
  rescue_from ActiveRecord::StatementInvalid, with: :render_invalid_statement

  private

  def render_not_found(exception)
    render json: {
      error: {
        message: exception.message
      }
    }, status: :not_found
  end

  def render_active_record_failure(exception)
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
