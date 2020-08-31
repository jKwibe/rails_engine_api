require 'rails_helper'

RSpec.describe '' do
  it 'list item merchant' do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)

    get "/api/v1/items/#{item.id}/merchant"

    data = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(data[:data][:attributes][:name]).to eq(merchant.name)
  end
end