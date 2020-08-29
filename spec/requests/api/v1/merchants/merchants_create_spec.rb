require 'rails_helper'

RSpec.describe 'can create merchant' do
  #TODO Add sad paths for create
  # TODO {wrong attribute name}
  it 'creates merchant' do
    merchant_params = { name: 'Last code bender inc'}
    post '/api/v1/merchants', params: {merchant: merchant_params}

    data =  JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(201)
    expect(data[:data][:attributes][:name]).to eq('Last code bender inc')
  end
end