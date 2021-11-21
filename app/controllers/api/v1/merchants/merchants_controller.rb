class Api::V1::Merchants::MerchantsController < ApplicationController
  def index
    render json: object_serializer(MerchantSerializer, Merchant.all), status: :ok
  end

  def show
    render json: object_serializer(MerchantSerializer, Merchant.find(params[:id])), status: :ok
  end

  def create
    render json: object_serializer(MerchantSerializer, Merchant.create!(merchant_params)), status: :created
  end

  def update
    render json: object_serializer(MerchantSerializer, Merchant.update(params[:id], merchant_params)), status: :ok
  end

  def destroy
    Merchant.destroy(params[:id])
    render json: { message: "Merchant id #{params[:id]} has been destroyed successfully"}, status: :ok
  end

  private

  def merchant_params
    params.permit(:name)
  end
end
