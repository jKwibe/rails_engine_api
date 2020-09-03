require 'rails_helper'

RSpec.describe 'Merchant Item' do
  it 'list item merchant' do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)

    get "/api/v1/items/#{item.id}/merchant"

    data = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(data[:data][:attributes][:name]).to eq(merchant.name)
  end

  it 'should rise an error' do
    get "/api/v1/items/b44/merchant"

    error = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(404)
    expect(error[:error][:message]).to eq("Couldn't find Item with 'id'=b44")
  end
end