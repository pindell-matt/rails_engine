class Invoice < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :customer
  has_many   :invoice_items
  
  validates_presence_of :status

  enum status: %w(shipped)
end
