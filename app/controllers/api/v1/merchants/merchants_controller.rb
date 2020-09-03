class Api::V1::Merchants::MerchantsController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.all), status: :ok
  end

  def show
    begin
      render json: MerchantSerializer.new(Merchant.find(params[:id])), status: :ok
    rescue => e
      render json: { error: { status: 404, message: e.message } }, status: :not_found
    end
  end

  def create
    begin
      render json: MerchantSerializer.new(Merchant.create!(merchant_params)), status: :created
    rescue => e
      render json: { error: { status: 400, message: e.message } }, status: :bad_request
    end
  end

  def update
    render json: MerchantSerializer.new(Merchant.update(params[:id], merchant_params)), status: :ok
  end

  def destroy
    Merchant.destroy(params[:id])
    render status: :no_content
  end

  private

  def merchant_params
    params.permit(:name)
  end
end
