module  ErrorHandler
  extend ActiveSupport::Concern

  ERRORS_STATUS = {
    'ActiveRecord::RecordNotFound' => 404,
    'ActiveRecord::RecordInvalid' => 400,
    'Exceptions::InvalidParams' => 422
  }.freeze

  included do
    rescue_from StandardError, with: ->(e){ handle_error(e) }
  end

  private

  def handle_error(e)
    msg = e.message
    error = Errors::ErrorFormulator.new(msg: msg, status: ERRORS_STATUS[e.class.name])
    renderer(error)
  end

  def renderer(e)
    render json: object_serializer(ErrorHandlerSerializer, e), status: e.status
  end
end