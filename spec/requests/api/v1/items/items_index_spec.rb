require 'rails_helper'

RSpec.describe 'All items' do
  let(:merchant) { create(:merchant) }
  let(:data) { JSON.parse(response.body, symbolize_names: true)}
  before do
    4.times { create(:item, merchant: merchant) }
  end

  it 'get all items' do
    get '/api/v1/items'

    expect(response.status).to eq(200)
    expect(data[:data].size).to eq(4)
  end
end