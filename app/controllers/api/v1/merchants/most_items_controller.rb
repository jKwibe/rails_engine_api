class Api::V1::Merchants::MostItemsController < ApplicationController
  def index
    render json: object_serializer(MerchantSerializer, Merchant.items_sold(params[:quantity])), status: :ok
  end

  def show
    render json: object_serializer(MerchantSerializer, Merchant.most_revenue(params[:quantity])), status: :ok
  end
end
