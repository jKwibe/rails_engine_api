require 'rails_helper'

RSpec.describe 'Delete Merchant' do
  it 'Destroy a merchant' do
    merchant = create(:merchant)
    delete "/api/v1/merchants/#{merchant.id}"

    expect(response.status).to eq(200)
    expect{Merchant.find(merchant.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end