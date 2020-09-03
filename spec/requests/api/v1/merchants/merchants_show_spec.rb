require 'rails_helper'

RSpec.describe 'Show Merchant' do
  #TODO write test for sad paths
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
    expect(data[:data].keys).to eq([:id, :type, :attributes])
    expect(data[:data][:attributes].keys).to eq([:name])
  end
end