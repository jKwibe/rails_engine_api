class TotalRevenue
  attr_reader :id
  def initialize(start_time, end_time)
    @start_time = start_time
    @end_time = end_time
  end

  def revenue
    Invoice.total_revenue(@start_time, @end_time)
  end
end