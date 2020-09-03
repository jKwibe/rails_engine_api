class Merchant < ApplicationRecord
  validates :name, presence: true
  has_many :items, dependent: :destroy
  has_many :invoices, dependent: :destroy

  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  def self.find_match(query_params)
    where("lower(#{query_params.keys.first}) LIKE ?", "%#{query_params.values.first.downcase}%").first
  end

  def self.find_all(query_params)
    where("lower(#{query_params.keys.first}) LIKE ?", "%#{query_params.values.first.downcase}%")
  end

  def self.items_sold(limit)
    joins(invoices: [:transactions, :invoice_items])
    .where("invoices.status = 'shipped' AND transactions.result = 'success'")
    .group(:id)
    .select('merchants.* , SUM(invoice_items.quantity) AS items_sold')
    .order(items_sold: :desc)
    .limit(limit)
  end

  def self.most_revenue(limit)
    joins(invoices: [:transactions, :invoice_items])
    .where("transactions.result = 'success' AND invoices.status = 'shipped'")
    .group(:id).select("merchants.* , SUM(invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
    .order(total_revenue: :desc)
    .limit(limit)
  end

  def revenue
    invoice_items
    .joins(:transactions)
    .where('invoices.status = ? AND transactions.result = ?', 'shipped', 'success')
    .sum('invoice_items.unit_price * invoice_items.quantity')
  end
end
