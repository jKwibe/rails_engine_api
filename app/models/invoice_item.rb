class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  has_many :merchants, through: :invoice
  has_many :transactions, through: :invoice
end
