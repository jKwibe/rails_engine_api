class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true

  belongs_to :merchant
  has_many :invoice_items, dependent: :destroy
  has_many :invoices, through: :invoice_items

  scope :filter_by_params, ->(key, value) {
    where("lower(#{key}) LIKE ?", "%#{value.downcase}%")
  }

end
