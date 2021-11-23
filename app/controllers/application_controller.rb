class ApplicationController < ActionController::API
  include ErrorHandler

  def object_serializer(serializer_klass, *args)
    serializer_klass.new(*args)
  end
end
