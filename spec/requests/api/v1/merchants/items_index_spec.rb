require 'rails_helper'

RSpec.describe 'Merchant Items'do
  before :each do
    @merchant_1 = create(:merchant)
    @merchant_2 = create(:merchant)

    create(:item, merchant: @merchant_1)
    create(:item, merchant: @merchant_1)
    create(:item, merchant: @merchant_2)
    create(:item, merchant: @merchant_1)
    create(:item, merchant: @merchant_2)
    create(:item, merchant: @merchant_1)
  end

  it 'should list all items belonging to a merchant ' do
    get "/api/v1/merchants/#{@merchant_2.id}/items"

    data =  JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    expect(data[:data].size).to eq(2)
    expect(data[:data][0][:attributes].keys).to eq([:name, :description, :unit_price, :merchant_id])
  end

  it 'should rise an error' do
    get "/api/v1/merchants/bb44/items"

    error =  JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(404)
    expect(error[:error][:message]).to eq("Couldn't find Merchant with 'id'=bb44")
  end
end