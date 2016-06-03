class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices

  validates_presence_of :first_name
  validates_presence_of :last_name

  # scope :with_valid_transactions, -> { where() }

  scope :with_valid_transactions, -> {
    joins(invoices: :invoice_items).where("transactions.result = 'success'")
                                   .select("customers.*")
  }
end
