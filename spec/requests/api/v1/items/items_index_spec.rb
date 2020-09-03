require 'rails_helper'

RSpec.describe 'All items' do
  it 'get all items' do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)

    create(:item, merchant: merchant_1)
    create(:item, merchant: merchant_2)
    create(:item, merchant: merchant_1)
    create(:item, merchant: merchant_2)

    get '/api/v1/items'

    data = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    expect(data[:data].size).to eq(4)
  end
end