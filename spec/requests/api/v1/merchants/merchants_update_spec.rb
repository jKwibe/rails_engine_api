require 'rails_helper'

RSpec.describe 'Update merchant' do
  it 'can update merchant' do
    merchant = create(:merchant, name: 'Last Code-Bender inc')
    patch "/api/v1/merchants/#{merchant.id}", params: {name: 'Korra inc'}

    data =  JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    expect(data[:data][:attributes][:name]).to eq('Korra inc')
  end
end