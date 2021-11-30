class Api::V1::Items::SearchController < ApplicationController
  def show
    render json: object_serializer(ItemSerializer, Filter.find_match(request.query_parameters, 'Item')),
           status: :ok
  end

  def index
    render json: object_serializer(ItemSerializer, Filter.scope_filter(request.query_parameters, 'Item')),
           status: :ok
  end
end
