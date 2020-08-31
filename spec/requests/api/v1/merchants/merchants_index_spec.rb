require 'rails_helper'

RSpec.describe 'shows all merchants' do
  before :each do
    @merchant_1 = create(:merchant)
    @merchant_2 = create(:merchant)
    @merchant_3 = create(:merchant)
    @merchant_4 = create(:merchant)
  end

  it 'gets all merchants' do
    get api_v1_merchants_path

    data = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(response.status).to eq(200)

    expect(data[:data].first.keys).to eq([:id, :type, :attributes])
    expect(data[:data].first[:attributes].keys).to eq([:name])
    expect(data[:data].length).to eq(4)
  end
end