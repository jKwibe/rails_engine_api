class Merchant < ApplicationRecord
  validates :name, presence: true
  has_many :items, dependent: :delete_all
  has_many :invoices, dependent: :delete_all
  has_many :customers, through: :invoices
end
