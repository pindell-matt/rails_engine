require 'csv'

namespace :import do

  task customers: :environment do
    puts "Start Customers"
    filepath = File.path("#{Rails.root}/public/data/customers.csv")
    CSV.foreach(filepath, headers: true) do |row|
      Customer.create!(row.to_hash)
    end
    puts "Customers Imported"
  end

  task merchants: :environment do
    puts "Start Merchants"
    filepath = File.path("#{Rails.root}/public/data/merchants.csv")
    CSV.foreach(filepath, headers: true) do |row|
      Merchant.create!(row.to_hash)
    end
    puts "Merchants Imported"
  end

  task items: :environment do
    puts "Start Items"
    filepath = File.path("#{Rails.root}/public/data/items.csv")
    CSV.foreach(filepath, headers: true) do |row|
      Item.create!(row.to_hash)
    end
    puts "Items Imported"
  end

  task invoices: :environment do
    puts "Start Invoices"
    filepath = File.path("#{Rails.root}/public/data/invoices.csv")
    CSV.foreach(filepath, headers: true) do |row|
      Invoice.create!(row.to_hash)
    end
    puts "Invoices Imported"
  end

  task invoice_items: :environment do
    puts "Start Invoice Items"
    filepath = File.path("#{Rails.root}/public/data/invoice_items.csv")
    CSV.foreach(filepath, headers: true) do |row|
      InvoiceItem.create!(row.to_hash)
    end
    puts "Invoice Items Imported"
  end

  task transactions: :environment do
    puts "Start Transactions"
    filepath = File.path("#{Rails.root}/public/data/transactions.csv")
    CSV.foreach(filepath, headers: true) do |row|
      Transaction.create!(row.to_hash)
    end
    puts "Transactions Imported"
  end

  task all: [
    :customers,
    :merchants,
    :items,
    :invoices,
    :invoice_items,
    :transactions
  ]

end
