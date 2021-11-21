class Merchant < ApplicationRecord
  validates :name, presence: true
  has_many :items, dependent: :destroy
  has_many :invoices, dependent: :destroy

  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  scope :successful_shipped, -> {
    joins(invoices: [:transactions, :invoice_items])
      .where("invoices.status = 'shipped' AND transactions.result = 'success'")
  }

  scope :items_sold, ->(limit){
    successful_shipped
      .select('merchants.*, SUM(invoice_items.quantity) AS sum_invoice_items_quantity')
      .order('sum_invoice_items_quantity DESC')
      .limit(limit)
      .group(:id)
  }

  scope :most_revenue, ->(limit) {
    successful_shipped
      .select('merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) as sum_invoice_quantity')
      .order('sum_invoice_quantity DESC')
      .limit(limit)
      .group(:id)
  }

  scope :filter_by_params, ->(key, value) {
    where("lower(#{key}) LIKE ?", "%#{value.downcase}%")
  }

  def revenue
    invoice_items
    .joins(:transactions)
    .where('invoices.status = ? AND transactions.result = ?', 'shipped', 'success')
    .sum('invoice_items.unit_price * invoice_items.quantity')
  end
end
