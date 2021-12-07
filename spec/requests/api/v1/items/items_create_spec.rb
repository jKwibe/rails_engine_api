require 'rails_helper'

RSpec.describe 'Item Create' do
  let(:merchant) { create(:merchant) }
  let(:resource) { JSON.parse(response.body, symbolize_names: true) }

  it 'create an item' do
    post '/api/v1/items', params: {name: 'colgate', description: 'Best Toothpaste', unit_price: 9.50, merchant_id: merchant.id }

    expect(response.status).to eq(201)
    expect(resource[:data].keys).to include(:id)
    expect(resource[:data].keys).to include(:type)
    expect(resource[:data].keys).to include(:attributes)
    expect(resource[:data].keys).to include(:relationships)
    expect(resource[:data][:attributes].keys).to eq([:name, :description, :unit_price, :merchant_id])
    expect(resource[:data][:attributes][:name]).to eq('colgate')
    expect(resource[:data][:attributes][:description]).to eq('Best Toothpaste')
    expect(resource[:data][:attributes][:unit_price]).to eq(9.50)

  end

  it 'raises an error if lack of details' do
    post '/api/v1/items', params: {name: 'colgate', unit_price: 9.50, merchant_id: merchant.id }

    expect(response.status).to eq(400)
    expect(resource[:data][:attributes][:message]).to eq('Validation failed: Description can\'t be blank')
  end
end