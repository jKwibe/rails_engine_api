class Customer < ApplicationRecord
  has_many :invoices, dependent: :delete_all
  has_many :merchants, through: :invoices
end
