class Api::V1::Merchants::RevenueController < ApplicationController
  def show
    render json: RevenueSerializer.new(MerchantRevenue.new(params[:id])), status: :ok
  end

  def index
    render json: RevenueSerializer.new(TotalRevenue.new(params[:start], params[:end])), status: :ok
  end
end