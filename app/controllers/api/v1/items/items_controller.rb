class Api::V1::Items::ItemsController < ApplicationController
  def index
    render json: ItemSerializer.new(Item.all), status: :ok
  end

  def show
    begin
      render json: ItemSerializer.new(Item.find(params[:id])), status: :ok
    rescue => e
      render json: {error: { status: 404, message: e.message}}, status: :not_found
    end
  end

  def create
    begin
      merchant = Merchant.find(params[:merchant_id])
      render json: ItemSerializer.new(merchant.items.create!(item_params)), status: :created
    rescue => error
      render json: { error: { status: 422, message: error.message}}, status: :unprocessable_entity
    end
  end

  def update
    begin
     render json: ItemSerializer.new(Item.update(params[:id], item_params)), status: :ok
    rescue => error
      render json: {error: {status: 404, message: error.message}}, status: :not_found
    end
  end

  def destroy
    begin
      Item.destroy(params[:id])
      render  status: :no_content
    rescue => error
      render json: {error: {status: 404, message: error.message}}, status: :not_found
    end
  end

  private

  def item_params
    params.permit(:name, :description, :unit_price, :merchant_id)
  end
end