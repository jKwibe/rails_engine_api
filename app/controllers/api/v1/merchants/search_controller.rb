class Api::V1::Merchants::SearchController < ApplicationController
  def index
    begin
      render json: MerchantSerializer.new(Merchant.find_all(request.query_parameters)), status: :ok
    rescue
      render json: { error: { status: 400, message: 'Unidentified attribute Entered'}}, status: :bad_request
    end
  end

  def show
    begin
      render json: MerchantSerializer.new(Merchant.find_match(request.query_parameters)), status: :ok
    rescue
      render json: { error: { status: 400, message: 'Unidentified attribute Entered'}}, status: :bad_request
    end
  end
end
