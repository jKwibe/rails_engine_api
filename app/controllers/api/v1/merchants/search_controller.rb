class Api::V1::Merchants::SearchController < ApplicationController
  def index
    render json: object_serializer(MerchantSerializer, Filter.scope_filter(request.query_parameters, 'Merchant')),
           status: :ok
  end

  def show
    render json: object_serializer(MerchantSerializer, Filter.find_match(request.query_parameters, 'Merchant')),
           status: :ok
  end
end
