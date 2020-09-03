require 'csv'
require_relative 'import_data.rb'
desc "Import product from csv file"
task :import => [:environment] do
  Transaction.destroy_all
  InvoiceItem.destroy_all
  Item.destroy_all
  Invoice.destroy_all
  Merchant.destroy_all
  Customer.destroy_all

  ImportData.get_csv('customers', Customer)
  ImportData.get_csv('merchants', Merchant)
  ImportData.get_csv('items', Item)
  ImportData.get_csv('invoices', Invoice)
  ImportData.get_csv('invoice_items', InvoiceItem)
  ImportData.get_csv('transactions', Transaction)

  ActiveRecord::Base.connection.tables.each do |t|
    ActiveRecord::Base.connection.reset_pk_sequence!(t)
  end
end