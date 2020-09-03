require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe 'relationships' do
    it { should belong_to :merchant }
    it { should belong_to :customer }
    it { should have_many :transactions }
    it { should have_many :invoice_items }
    it { should have_many(:items).through(:invoice_items) }
  end

  describe 'methods' do
    before :each do
      @invoice1 = create(:invoice, created_at: "2012-03-25 01:00:00 UTC", updated_at: "2012-03-20 01:17:08 UTC")
      @invoice2 = create(:invoice, created_at: "2012-03-21 01:00:00 UTC", updated_at: "2012-03-21 01:17:08 UTC")
      @invoice3 = create(:invoice, created_at: "2012-03-18 01:00:00 UTC", updated_at: "2012-03-18 01:17:08 UTC")
      @invoice4 = create(:invoice, created_at: "2012-03-16 01:00:00 UTC", updated_at: "2012-03-16 01:17:08 UTC")

      @invoice_item1 = create(:invoice_item, invoice: @invoice1, quantity: 7, unit_price: 30.45)
      @invoice_item2 = create(:invoice_item, invoice: @invoice1, quantity: 12, unit_price: 15.20)
      @invoice_item3 = create(:invoice_item, invoice: @invoice2, quantity: 27, unit_price: 65.00)
      @invoice_item4 = create(:invoice_item, invoice: @invoice2, quantity: 9, unit_price: 26.72)
      @invoice_item5 = create(:invoice_item, invoice: @invoice3, quantity: 32, unit_price: 30.87)
      @invoice_item6 = create(:invoice_item, invoice: @invoice3, quantity: 21, unit_price: 123.76)
      @invoice_item7 = create(:invoice_item, invoice: @invoice4, quantity: 15, unit_price: 123.76)

      @transaction1 = create(:transaction, invoice: @invoice1)
      @transaction2 = create(:transaction, invoice: @invoice2)
      @transaction3 = create(:transaction, invoice: @invoice3)
      @transaction4 = create(:transaction, invoice: @invoice2, result: "failed")
      @transaction5 = create(:transaction, invoice: @invoice1)
      @transaction6 = create(:transaction, invoice: @invoice1)
    end

    it '.total_revenue' do
      revenue = Invoice.total_revenue('2012-03-09', '2012-03-24')
      expect(revenue).to eq(6768.93)
    end
  end
end