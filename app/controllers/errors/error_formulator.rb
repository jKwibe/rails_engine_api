module Errors
  class ErrorFormulator < Errors::StandardError
    attr_reader :id
    def initialize(msg: nil, status: nil)
      super
    end
  end
end
