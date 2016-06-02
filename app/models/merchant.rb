class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices

  validates_presence_of :name

  scope :most_revenue, -> quantity {
    joins(invoices: [:transactions, :invoice_items]).where("transactions.result = 'success'")
                                                    .select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS total")
                                                    .group("id")
                                                    .order("total DESC")
                                                    .take(quantity)
  }


  scope :most_items, -> quantity {
    joins(invoices: [:transactions, :invoice_items]).where("transactions.result = 'success'")
                                                    .select("merchants.*, SUM(invoice_items.quantity) AS total")
                                                    .group("id")
                                                    .order("total DESC")
                                                    .take(quantity)
  }

  scope :revenue, -> date {
    joins(invoices: :invoice_items).where("invoices.created_at = ?", date)
                                   .sum("invoice_items.quantity * invoice_items.unit_price")
  }

  scope :individual_revenue, -> id {
    joins(invoices: [:transactions, :invoice_items]).where("transactions.result = 'success'")
                                                    .where("merchants.id = ?", id)
                                                    .sum("invoice_items.quantity * invoice_items.unit_price")

  }

  scope :individual_revenue_by_date, -> id, date {
    joins(invoices: :invoice_items).where("invoices.created_at = ?", date)
                                   .where("merchants.id = ?", id)
                                   .sum("invoice_items.quantity * invoice_items.unit_price")
  }



end
