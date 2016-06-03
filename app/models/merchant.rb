class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :customers,     through: :invoices
  has_many :transactions,  through: :customers

  validates_presence_of :name

  # transactions: { result: 'success' }
  scope :most_revenue, -> quantity {
    joins(invoices: [:transactions, :invoice_items]).where("transactions.result = 'success'")
                                                    .select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS total")
                                                    .group("id")
                                                    .order("total DESC")
                                                    .take(quantity)
  }

  # scope :most_rev, -> quantity {
  #   joins(:invoice_items).group(:id).order('sum(invoice_items.quantity*invoice_items.unit_price) DESC').take(quantity)
  # }

  scope :most_items, -> quantity {
    joins(invoices: [:transactions, :invoice_items]).where("transactions.result = 'success'")
                                                    .select("merchants.*, SUM(invoice_items.quantity) AS total")
                                                    .group("id")
                                                    .order("total DESC")
                                                    .take(quantity)
  }

  scope :individual_revenue, -> id {
    joins(invoices: [:transactions, :invoice_items]).where("transactions.result = 'success'")
                                                    .where("merchants.id = ?", id)
                                                    .sum("invoice_items.quantity * invoice_items.unit_price")

  }

  scope :individual_revenue_by_date, -> id, date {
    find(id).invoice_items.where("invoices.created_at = ?", date)
                          .sum("invoice_items.quantity * invoice_items.unit_price")
  }

  # merge(Transaction.failed)
  scope :customers_with_pending_invoices, -> id {
    find(id).invoices.joins(:transactions).where("transactions.result = 'failed'").uniq.count
  }

  def self.revenue(date)
    result = joins(invoices: :invoice_items).where("invoices.created_at = ?", date)
                                            .sum("invoice_items.quantity * invoice_items.unit_price")
    { "total_revenue" => (result / 100.00).to_s }
  end

end
