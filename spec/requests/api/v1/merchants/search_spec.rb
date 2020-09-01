require 'rails_helper'

RSpec.describe 'Merchant Find' do
  before(:each) do
    create(:merchant, name: 'Korra Inc')
    create(:merchant, name: 'Rokku Inc')
    create(:merchant, name: 'Kyoshi Inc')
    create(:merchant, name: 'Aang Inc')
  end
  it 'Find Single' do
    get '/api/v1/merchants/find?name=k'
    data = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    expect(data[:data][:attributes][:name]).to eq('Korra Inc')
  end

  it 'Find Single Throws error' do
    get '/api/v1/merchants/find?bad_attribute=k'
    error = JSON.parse(response.body, symbolize_names: true)
    expect(error[:error][:message]).to eq('Unidentified attribute Entered')
  end

  it 'Finds Multiple' do
    get '/api/v1/merchants/find_all?name=k'
    data = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    expect(data[:data][0][:attributes].keys).to eq([:name])
    expect(data[:data].size).to eq(3)
    expect(data[:data].first.keys).to eq([:id, :type, :attributes])
  end

  it 'Find Multiple Throws error' do
    get '/api/v1/merchants/find_all?bad_attribute=co'
    error = JSON.parse(response.body, symbolize_names: true)
    expect(error[:error][:message]).to eq('Unidentified attribute Entered')
  end
end