class Api::V1::Merchants::ItemsController < ApplicationController
  def index
      merchant = Merchant.find(params[:id])
      render json: object_serializer(ItemSerializer, merchant.items), status: :ok
  end
end