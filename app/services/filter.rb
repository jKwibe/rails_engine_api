class Filter
  def self.scope_filter(params, resource_klass)
    new(params, resource_klass).filter_param
  end

  def self.find_match(params, resource_klass)
    new(params, resource_klass).find_first_match
  end

  attr_reader :params, :model_resource

  def initialize(params, resource_klass)
    @params = params
    @model_resource = resource_klass.constantize
  end

  def filter_param
    resources = model_resource.all
    params.each do |param, value|
      resources = model_resource.filter_by_params(param, value) if valid?(param)
    end
    resources
  end

  def find_first_match
    filter_param.first
  end

  private

  def resource_columns
    model_resource.column_names
  end

  def valid?(param)
    resource_columns.include?(param)
  end
end