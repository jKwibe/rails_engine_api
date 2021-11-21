class TotalRevenue
  attr_reader :id
  def initialize(start_time: , end_time:)
    @start_time = start_time
    @end_time = end_time
    @id = SecureRandom.uuid
  end

  def revenue
    raise Exceptions::InvalidParams.new('[start] and [end] query params should be defined') if @end_time.nil? || @start_time.nil?
    Invoice.total_revenue(start: @start_time, finish: @end_time)
  end
end