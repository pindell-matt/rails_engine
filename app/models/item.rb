class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many   :invoice_items
  has_many   :invoices,     through: :invoice_items
  has_many   :transactions, through: :invoices

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :unit_price
end
