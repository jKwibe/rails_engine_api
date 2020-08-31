class Api::V1::Merchants::MerchantsController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.all), status: :ok
  end

  def show
    begin
      render json: MerchantSerializer.new(Merchant.find(params[:id])), status: :ok
    rescue => e
      render json: { error: { status: 404, message: e.message }}, status: :not_found
    end
  end

  def create
    begin
      render json: MerchantSerializer.new(Merchant.create!(merchant_params)), status: :created
    rescue
      render json: { error: { status: 400, message: 'Resource not saved check on your values.'}}
    end
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
  #TODO sad paths for show update create and delete
end
