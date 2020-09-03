class Api::V1::Items::MerchantController < ApplicationController
  def index
    begin
      item = Item.find(params[:id])
      render json: MerchantSerializer.new(item.merchant), status: :ok
    rescue => error
      render json: { error: { message: error.message, status: 404 } }, status: :not_found
    end
  end
end
