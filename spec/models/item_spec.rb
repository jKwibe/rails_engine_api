require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :merchant}
    it { should have_many :invoice_items}
    it { should have_many(:invoices).through(:invoice_items)}
  end

  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :description}
    it { should validate_presence_of :unit_price}
  end

  describe 'methods' do
    before(:each) do
      create(:item, name: 'Colgate')
      create(:item, name: 'Mouse')
      create(:item, name: 'Comb')
      create(:item, name: 'Computer')
    end
    it '.find_match' do
      data = Item.find_match({"name": "Mo"})
      expect(data.name).to eq("Mouse")
    end

    it '.find_all' do
      data = Item.find_all({"name": "te"})
      expect(data.size).to eq(2)
    end
  end
end