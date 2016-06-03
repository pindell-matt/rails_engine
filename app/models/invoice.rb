class Invoice < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :customer
  has_many   :invoice_items
  has_many   :items, through: :invoice_items
  has_many   :transactions

  validates_presence_of :status
  validates_presence_of :customer_id
  validates_presence_of :merchant_id

  scope :pending, -> { where("status != 'shipped'") }
end
