class Api::V1::Items::ItemsController < ApplicationController
  def index
    render json: object_serializer(ItemSerializer, Item.all), status: :ok
  end

  def show
    render json: object_serializer(ItemSerializer, Item.find(params[:id])), status: :ok
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    render json: object_serializer(ItemSerializer, merchant.items.create!(item_params)), status: :created
  end

  def update
    render json: object_serializer(ItemSerializer, Item.update(params[:id], item_params)), status: :ok
  end

  def destroy
    render json: object_serializer(ItemSerializer, Item.destroy(params[:id])),  status: :ok
  end

  private

  def item_params
    params.permit(:name, :description, :unit_price, :merchant_id)
  end
end