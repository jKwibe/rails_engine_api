class MerchantRevenue
  def initialize(id)
    @obj_id = id
  end
  def id
    @obj_id
  end

  def revenue
    Merchant.find(@obj_id).revenue
  end
end