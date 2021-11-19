class Api::V1::Merchants::MerchantsController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.all), status: :ok
  end

  def show
      render json: MerchantSerializer.new(Merchant.find(params[:id])), status: :ok
  end

  def create
    render json: MerchantSerializer.new(Merchant.create!(merchant_params)), status: :created
  end

  def update
    render json: MerchantSerializer.new(Merchant.update(params[:id], merchant_params)), status: :ok
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
