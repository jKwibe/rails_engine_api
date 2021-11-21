class Api::V1::Items::MerchantController < ApplicationController
  def index
    item = Item.find(params[:id])
    render json: object_serializer(MerchantSerializer, item.merchant), status: :ok
  end
end
