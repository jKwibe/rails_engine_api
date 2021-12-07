require 'rails_helper'

RSpec.describe 'Delete Item' do
  let!(:item) { create(:item, name: 'Colgate') }
  let(:data) { JSON.parse(response.body, symbolize_names: true) }

  it 'delete item' do
    delete "/api/v1/items/#{item.id}"

    expect(response.status).to eq(200)
    expect{ Item.find(item.id) }.to raise_error(ActiveRecord::RecordNotFound)
  end

  it 'throws an error' do
    delete "/api/v1/items/m99"

    expect(response.status).to eq(404)
    expect(data[:data][:attributes][:message]).to eq("Couldn't find Item with 'id'=m99")
  end
end