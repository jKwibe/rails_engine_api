require 'rails_helper'

RSpec.describe 'Update' do
  it 'Updates item' do
    item_1 = create(:item, unit_price: 33.59)
    patch "/api/v1/items/#{item_1.id}", params: { unit_price: 30.67, name: 'Colgate'}

    data = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    expect(data[:data][:attributes][:name]).to eq('Colgate')
    expect(data[:data][:attributes][:unit_price]).to eq(30.67)
  end

  it 'throws an error if an exception' do
    create(:item, unit_price: 33.59)
    item_params = { unit_price: 30.67, name: 'Colgate'}
    patch "/api/v1/items/m99", params: { item: item_params }

    error = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(404)
    expect(error[:error][:message]).to eq('Couldn\'t find Item with \'id\'=m99')
  end
end