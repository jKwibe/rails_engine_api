module Errors
  class StandardError < ::StandardError
    attr_reader :status, :message
    def initialize(msg: nil, status: nil)
      @message = msg || "Oops! Something has gone wrong, we will notify our Engineers"
      @status = status || 500
    end
  end
end