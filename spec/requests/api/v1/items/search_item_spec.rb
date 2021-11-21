require 'rails_helper'

RSpec.describe 'Item Find' do
  before(:each) do
    create(:item, name: 'Colgate')
    create(:item, name: 'Mouse')
    create(:item, name: 'Comb')
    create(:item, name: 'Computer')
  end
  it 'Find Single' do
    get '/api/v1/items/find?name=Co'
    data = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    expect(data[:data][:attributes][:name]).to eq('Colgate')
  end

  it 'Finds Multiple' do
    get '/api/v1/items/find_all?name=om'
    data = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    expect(data[:data][0][:attributes].keys).to eq([:name, :description, :unit_price, :merchant_id])
    expect(data[:data].size).to eq(2)
  end

end