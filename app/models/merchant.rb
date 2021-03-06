class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :customers,     through: :invoices
  has_many :transactions,  through: :customers

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

  def self.revenue_by_date(date)
    result = joins(invoices: :invoice_items).where("invoices.created_at = ?", date)
                                            .sum("invoice_items.quantity * invoice_items.unit_price")
    { "total_revenue" => (result / 100.00).to_s }
  end

  def self.single_merchant_revenue(id)
    result = find(id).invoices.joins(:transactions, :invoice_items).where("transactions.result = 'success'")
                                                                   .sum("invoice_items.quantity * invoice_items.unit_price")
    { "revenue" => (result / 100.00).to_s }
  end

  def self.single_merchant_revenue_with_date(id, date)
    result = find(id).invoice_items.where("invoices.created_at = ?", date)
                                   .sum("invoice_items.quantity * invoice_items.unit_price")
    { "revenue" => (result / 100.00).to_s }
  end

  scope :customers_with_pending_invoices, -> id {
    find(id).invoices.joins(:transactions).where("transactions.result = 'failed'").joins(:customer).uniq
  }

  scope :favorite_customer, -> id {
    find(id).customers
            .joins(:transactions)
            .where("transactions.result = 'success'")
            .select("customers.*, COUNT(invoices.merchant_id) AS results")
            .group("id")
            .order("results DESC")
            .first
  }

end
