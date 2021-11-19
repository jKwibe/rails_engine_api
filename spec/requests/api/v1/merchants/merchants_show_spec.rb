require 'rails_helper'

RSpec.describe 'Show Merchant' do
  before :each do
    @merchant_1 = create(:merchant)
    @merchant_2 = create(:merchant)
    @merchant_3 = create(:merchant)
    @merchant_4 = create(:merchant)
  end
  it 'shows a single merchant' do
    get "/api/v1/merchants/#{@merchant_3.id}"

    data = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(data[:data][:id]).to eq(@merchant_3.id.to_s)
    expect(data[:data].keys).to include(:id)
    expect(data[:data].keys).to include(:type)
    expect(data[:data].keys).to include(:attributes)
    expect(data[:data].keys).to include(:relationships)
    expect(data[:data][:attributes].keys).to eq([:name])
  end

  it 'should throw error' do
    get "/api/v1/merchants/b44"

    error = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(404)
    expect(error[:error][:message]).to eq("Couldn't find Merchant with 'id'=b44")
  end
end