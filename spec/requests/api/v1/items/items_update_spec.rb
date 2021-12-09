require 'rails_helper'

RSpec.describe 'Update' do
  let(:item) { create(:item, unit_price: 33.59) }
  let(:params) { { unit_price: 30.67, name: 'Colgate'} }
  let(:body) { JSON.parse(response.body, symbolize_names: true) }

  it 'Updates item' do
    patch "/api/v1/items/#{item.id}", params: params

    expect(response.status).to eq(200)
    expect(body[:data][:attributes][:name]).to eq('Colgate')
    expect(body[:data][:attributes][:unit_price]).to eq(30.67)
  end

  it 'throws an error if an exception' do
    patch "/api/v1/items/m99", params: params

    expect(response.status).to eq(404)
    expect(body[:data][:attributes][:message]).to eq('Couldn\'t find Item with \'id\'=m99')
  end
end