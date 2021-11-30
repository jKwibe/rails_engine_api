class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions, dependent: :delete_all
  has_many :invoice_items
  has_many :items, through: :invoice_items

  def self.total_revenue(start:, finish:)
    start_date = Date.parse(start).beginning_of_day
    end_date = Date.parse(finish).beginning_of_day

    joins(:transactions, :invoice_items)
      .where("invoices.status = 'shipped' AND transactions.result = 'success' AND invoices.updated_at BETWEEN ? AND ?", start_date, end_date)
      .sum('invoice_items.unit_price * invoice_items.quantity')
  end
end
