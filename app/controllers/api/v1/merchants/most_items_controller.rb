class Api::V1::Merchants::MostItemsController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.items_sold(params[:quantity])), status: :ok
  end

  def show
    render json: MerchantSerializer.new(Merchant.most_revenue(params[:quantity])), status: :ok
  end
end
