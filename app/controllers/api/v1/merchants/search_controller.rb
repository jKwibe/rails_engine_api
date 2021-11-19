class Api::V1::Merchants::SearchController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.find_all(request.query_parameters)), status: :ok
  end

  def show
    render json: MerchantSerializer.new(Merchant.find_match(request.query_parameters)), status: :ok
  end
end
