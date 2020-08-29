require 'rails_helper'

RSpec.describe 'Delete Merchant' do
  it 'Destroy a merchant' do
    merchant = create(:merchant)
    delete "/api/v1/merchants/#{merchant.id}"

    data = JSON.parse( response.body, symbolize_names: true )

    expect(response.status).to eq(200)
    expect(data[:data].keys).to eq([:id, :type, :attributes])
    expect(data[:data][:attributes].keys).to eq([:name])
    expect{Merchant.find(merchant.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end