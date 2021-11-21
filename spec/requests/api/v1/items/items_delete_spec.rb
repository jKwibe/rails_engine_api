require 'rails_helper'

RSpec.describe 'Delete Item' do
  it 'delete item' do
    item = create(:item, name: 'Colgate')
    create(:item)
    delete "/api/v1/items/#{item.id}"


    expect(response.status).to eq(200)
    expect{ Item.find(item.id) }.to raise_error(ActiveRecord::RecordNotFound)
  end

  it 'throws an error' do
    create(:item)
    delete "/api/v1/items/m99"

    data = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(404)
    expect(data[:error][:message]).to eq("Couldn't find Item with 'id'=m99")
  end
end