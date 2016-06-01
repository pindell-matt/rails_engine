require 'csv'

namespace :import do

  desc "Import Customers"
  task customers: :environment do
    filepath = File.path("#{Rails.root}/public/data/customers.csv")
    CSV.foreach(filepath, headers: true) do |row|
      Customer.create!(row.to_hash)
    end
    puts "Customers Imported"
  end

  desc "Import Merchants"
  task merchants: :environment do
    filepath = File.path("#{Rails.root}/public/data/merchants.csv")
    CSV.foreach(filepath, headers: true) do |row|
      Merchant.create!(row.to_hash)
    end
    puts "Merchants Imported"
  end

  desc "Import Items"
  task items: :environment do
    filepath = File.path("#{Rails.root}/public/data/items.csv")
    CSV.foreach(filepath, headers: true) do |row|
      Item.create!(row.to_hash)
    end
    puts "Items Imported"
  end

  desc "Import Invoices"
  task invoices: :environment do
    filepath = File.path("#{Rails.root}/public/data/invoices.csv")
    CSV.foreach(filepath, headers: true) do |row|
      Invoice.create!(row.to_hash)
    end
    puts "Invoices Imported"
  end

  desc "Import Invoice Items"
  task invoice_items: :environment do
    filepath = File.path("#{Rails.root}/public/data/invoice_items.csv")
    CSV.foreach(filepath, headers: true) do |row|
      InvoiceItem.create!(row.to_hash)
    end
    puts "Invoice Items Imported"
  end

  desc "Import Transactions"
  task transactions: :environment do
    filepath = File.path("#{Rails.root}/public/data/transactions.csv")
    CSV.foreach(filepath, headers: true) do |row|
      Transaction.create!(row.to_hash)
    end
    puts "Transactions Imported"
  end

  desc "Import All CSV Files"
  task all: [
    :customers,
    :merchants,
    :items,
    :invoices,
    :invoice_items,
    :transactions
  ]

end
