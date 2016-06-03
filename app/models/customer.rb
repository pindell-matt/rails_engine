class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants,    through: :invoices

  validates_presence_of :first_name
  validates_presence_of :last_name

  scope :favorite_merchant, -> id {
    find(id).merchants
            .joins(:transactions)
            .where("transactions.result = 'success'")
            .select("merchants.*, COUNT(invoices.customer_id) AS results")
            .group("id")
            .order("results DESC")
            .first
  }
end
