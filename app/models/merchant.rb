class Merchant < ApplicationRecord
  validates :name, presence: true
  has_many :items, dependent: :destroy
  has_many :invoices, dependent: :destroy

  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices

  def self.find_match(query_params)
    where("lower(#{query_params.keys.first}) LIKE ?", "%#{query_params.values.first.downcase}%").first
  end

  def self.find_all(query_params)
    where("lower(#{query_params.keys.first}) LIKE ?", "%#{query_params.values.first.downcase}%")
  end
end
