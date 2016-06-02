class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice

  validates_presence_of :quantity
  validates_presence_of :unit_price

  scope :total, -> { pluck('invoice_items.quantity * invoice_items.unit_price') }
end
