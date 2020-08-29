require 'rails_helper'

RSpec.describe 'Update merchant' do
  it 'can update merchant' do
    merchant = create(:merchant, name: 'Last Code-Bender inc')
    merchant_params = {name: 'Korra inc'}

    patch "/api/v1/merchants/#{merchant.id}", params: {merchant: merchant_params}

    data =  JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    expect(data[:data][:attributes][:name]).to eq('Korra inc')
  end
end