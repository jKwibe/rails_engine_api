require 'rails_helper'

RSpec.describe 'Merchant Find' do
  before(:each) do
    @merchant1 = create(:merchant, name: 'Korra Inc')
    @merchant2 = create(:merchant, name: 'Rokku Inc')
    @merchant3 = create(:merchant, name: 'Kyoshi Inc')
    @merchant4 = create(:merchant, name: 'Aang Inc')
  end
  it 'Find Single' do
    get '/api/v1/merchants/find?name=k'
    data = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    expect(data[:data][:attributes][:name]).to eq(@merchant1.name)
  end

  it 'Finds Multiple' do
    get '/api/v1/merchants/find_all?name=k'
    data = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    expect(data[:data][0][:attributes].keys).to eq([:name])
    expect(data[:data].size).to eq(3)
    expect(data[:data].first.keys).to include(:id)
    expect(data[:data].first.keys).to include(:type)
    expect(data[:data].first.keys).to include(:relationships)
    expect(data[:data].first.keys).to include(:attributes)
  end

  it 'Find Multiple Throws error' do
    get '/api/v1/merchants/find_all?bad_attribute=co'
    data = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    expect(data[:data][0][:attributes].keys).to eq([:name])
    expect(data[:data].size).to eq(4)
  end
end