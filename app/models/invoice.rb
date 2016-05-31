class Invoice < ActiveRecord::Base
  has_one :merchant
  has_one :customer
end
