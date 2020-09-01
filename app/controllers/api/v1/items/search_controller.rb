class Api::V1::Items::SearchController < ApplicationController
  def show
    begin
      render json: ItemSerializer.new(Item.find_match(request.query_parameters)), status: :ok
    rescue
      render json: { error: { status: 400, message: 'Unidentified attribute Entered'}}, status: :bad_request
    end
  end

  def index
    begin
      render json: ItemSerializer.new(Item.find_all(request.query_parameters)), status: :ok
    rescue
      render json: { error: { status: 400, message: 'Unidentified attribute Entered'}}, status: :bad_request
    end
  end
end
