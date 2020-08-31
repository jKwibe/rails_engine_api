require 'rails_helper'

RSpec.describe 'Show item' do
  before :each do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)

    @item_1 = create(:item, merchant: merchant_1)
    @item_2 = create(:item, merchant: merchant_2)
    @item_3 = create(:item, merchant: merchant_1)
    @item_4= create(:item, merchant: merchant_2)
  end
  it 'Display an item data' do

    get "/api/v1/items/#{@item_4.id}"

    data = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(data[:data][:attributes].keys).to eq([:name, :description, :unit_price])
    expect(data[:data][:attributes][:name]).to eq(@item_4.name)
    expect(data[:data][:attributes][:description]).to eq(@item_4.description)
    expect(data[:data][:attributes][:unit_price]).to eq(@item_4.unit_price)
  end

  it 'throws an error if id not found' do
    get "/api/v1/items/mm33"

    error = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(404)
    expect(error[:error][:message]).to eq('Couldn\'t find Item with \'id\'=mm33')
  end
end