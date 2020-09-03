class Api::V1::Merchants::ItemsController < ApplicationController
  def index
    begin
      merchant = Merchant.find(params[:id])
      render json: ItemSerializer.new(merchant.items), status: :ok
    rescue => error
      render json: { error: { message: error.message, status: 404 } }, status: :not_found
    end
  end
end