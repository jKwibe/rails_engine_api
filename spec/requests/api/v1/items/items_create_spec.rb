require 'rails_helper'

RSpec.describe 'Item Create' do
  it 'create an item' do
    merchant = create(:merchant)
    item_info = {name: 'colgate', description: 'Best Toothpaste', unit_price: 9.50, merchant_id: merchant.id }
    post '/api/v1/items', params: { merchant_id: merchant.id, item: item_info}

    resource = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(201)
    expect(resource[:data].keys).to eq([:id, :type, :attributes])
    expect(resource[:data][:attributes].keys).to eq([:name, :description, :unit_price])
    expect(resource[:data][:attributes][:name]).to eq('colgate')
    expect(resource[:data][:attributes][:description]).to eq('Best Toothpaste')
    expect(resource[:data][:attributes][:unit_price]).to eq(9.50)

  end

  it 'raises an error if lack of details' do
    merchant = create(:merchant)
    item_info = {name: 'colgate', unit_price: 9.50, merchant_id: merchant.id }
    post '/api/v1/items', params: { merchant_id: merchant.id, item: item_info}

    error = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(422)
    expect(error[:error][:message]).to eq('Validation failed: Description can\'t be blank')
  end
end