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
      create(:merchant, name: 'Korra Inc')
      create(:merchant, name: 'Rokku Inc')
      create(:merchant, name: 'Kyoshi Inc')
      create(:merchant, name: 'Aang Inc')
    end
    it '.find_match' do
      data = Merchant.find_match({"name": "k"})
      expect(data.name).to eq("Korra Inc")
    end

    it '.find_all' do
      data = Merchant.find_all({"name": "k"})
      expect(data.size).to eq(3)
    end
  end
end