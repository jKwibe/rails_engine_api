class Api::V1::Merchants::MerchantsController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.all), status: :ok
  end

  def show
    render json: MerchantSerializer.new(Merchant.find(params[:id])), status: :ok
  end

  def create
    render json: MerchantSerializer.new(Merchant.create(merchant_params)), status: :created
  end

  def update
    render json: MerchantSerializer.new(Merchant.update(params[:id], merchant_params)), status: :ok
  end

  def destroy
    render json: MerchantSerializer.new(Merchant.destroy(params[:id])), status: :ok
  end

  private

  def merchant_params
    params.require(:merchant).permit(:name)
  end
  #TODO update  action
  #TODO destroy action
  #TODO commit the changes
end
