class Api::V1::Merchants::RevenueController < ApplicationController
  def show
    render json: object_serializer(RevenueSerializer, MerchantRevenue.new(params[:id])), status: :ok
  end

  def index
    render json: object_serializer(RevenueSerializer, TotalRevenue.new(start_time: params[:start], end_time: params[:end]))
  end
end