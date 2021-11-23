class ErrorHandlerSerializer
  include FastJsonapi::ObjectSerializer
  set_type :error
  attributes :message, :status
end
