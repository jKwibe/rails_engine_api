class ApplicationController < ActionController::API
  include ErrorHandler

  private

  def object_serializer(serializer_klass, *args)
    serializer_klass.new(*args)
  end
end
