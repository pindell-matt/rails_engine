class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many   :invoice_items
  
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :unit_price
end
