class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true

  belongs_to :merchant
  has_many :invoice_items, dependent: :destroy
  has_many :invoices, through: :invoice_items

  def self.find_match(query_params)
    where("lower(#{query_params.keys.first}) LIKE ?", "%#{query_params.values.first.downcase}%").first
  end

  def self.find_all(query_params)
    where("lower(#{query_params.keys.first}) LIKE ?", "%#{query_params.values.first.downcase}%")
  end
end
