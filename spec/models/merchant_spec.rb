require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
  end

  describe 'relationships' do
    it { should have_many :items}
    it { should have_many :invoices}
    it { should have_many(:customers).through(:invoices)}
  end

  describe 'methods' do
    before(:each) do
      @merchant1 = create(:merchant, name: 'Korra Inc')
      @merchant2 = create(:merchant, name: 'Rokku Inc')
      @merchant3 = create(:merchant, name: 'Kyoshi Inc')
      @merchant4 = create(:merchant, name: 'Aang Inc')

      @item1 = create(:item, merchant: @merchant1, name: "Car Shoes", unit_price: 30.45, description: "NIghtly use", created_at: "2020-03-20 01:00:00 UTC", updated_at: "2020-03-20 01:17:08 UTC")
      @item2 = create(:item, merchant: @merchant1, name: "Tire", unit_price: 15.20, description: "interesting", created_at: "2020-03-21 01:00:00 UTC", updated_at: "2020-03-21 01:17:08 UTC")
      @item3 = create(:item, merchant: @merchant2, name: "Wheel", unit_price: 65.00, description: "All weather", created_at: "2020-03-18 01:00:00 UTC", updated_at: "2020-03-18 01:17:08 UTC")
      @item4 = create(:item, merchant: @merchant2, name: "Brake pad", unit_price: 26.72, description: "brand new", created_at: "2020-03-16 01:00:00 UTC", updated_at: "2020-03-16 01:17:08 UTC")
      @item5 = create(:item, merchant: @merchant3, name: "Shoes", unit_price: 30.87, description: "black and white", created_at: "2020-03-22 01:00:00 UTC", updated_at: "2020-03-22 01:17:08 UTC")
      @item6 = create(:item, merchant: @merchant3, name: "Socks", unit_price: 123.76, description: "no holes", created_at: "2020-03-19 01:00:00 UTC", updated_at: "2020-03-19 01:17:08 UTC")

      @invoice1 = create(:invoice, merchant: @merchant1, created_at: "2012-03-25 01:00:00 UTC", updated_at: "2012-03-20 01:17:08 UTC")
      @invoice2 = create(:invoice, merchant: @merchant2, created_at: "2012-03-21 01:00:00 UTC", updated_at: "2012-03-21 01:17:08 UTC")
      @invoice3 = create(:invoice, merchant: @merchant3, created_at: "2012-03-18 01:00:00 UTC", updated_at: "2012-03-18 01:17:08 UTC")
      @invoice4 = create(:invoice, merchant: @merchant3, created_at: "2012-03-16 01:00:00 UTC", updated_at: "2012-03-16 01:17:08 UTC")

      @invoice_item1 = create(:invoice_item, item: @item1, invoice: @invoice1, quantity: 7, unit_price: @item1.unit_price)
      @invoice_item2 = create(:invoice_item, item: @item2, invoice: @invoice1, quantity: 12, unit_price: @item2.unit_price)
      @invoice_item3 = create(:invoice_item, item: @item3, invoice: @invoice2, quantity: 27, unit_price: @item3.unit_price)
      @invoice_item4 = create(:invoice_item, item: @item4, invoice: @invoice2, quantity: 9, unit_price: @item4.unit_price)
      @invoice_item5 = create(:invoice_item, item: @item5, invoice: @invoice3, quantity: 32, unit_price: @item5.unit_price)
      @invoice_item6 = create(:invoice_item, item: @item6, invoice: @invoice3, quantity: 21, unit_price: @item6.unit_price)
      @invoice_item7 = create(:invoice_item, item: @item6, invoice: @invoice4, quantity: 15, unit_price: @item6.unit_price)

      @transaction1 = create(:transaction, invoice: @invoice1)
      @transaction2 = create(:transaction, invoice: @invoice2)
      @transaction3 = create(:transaction, invoice: @invoice3)
      @transaction4 = create(:transaction, invoice: @invoice2, result: "failed")
      @transaction5 = create(:transaction, invoice: @invoice1)
      @transaction6 = create(:transaction, invoice: @invoice1)
    end
    it '.find_match' do
      data = Merchant.find_match({"name": "k"})
      expect(data.name).to eq("Korra Inc")
    end

    it '.find_all' do
      data = Merchant.find_all({"name": "k"})
      expect(data.size).to eq(3)
    end

    it '.items_sold' do
      rank = Merchant.items_sold(2)
      expect(rank.to_a.size).to eq(2)
      expect(rank[0].name).to eq('Korra Inc')
    end

    it '.most revenue' do
      rank = Merchant.most_revenue(2)
      expect(rank.to_a.size).to eq(2)
      expect(rank[0].name).to eq('Kyoshi Inc')
    end

    it '#revenue' do
      revenue = @merchant1.revenue.round(2)
      expect(revenue).to eq(1186.65)
    end
  end
end