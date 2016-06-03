class Transaction < ActiveRecord::Base
  belongs_to :invoice

  validates_presence_of :invoice_id
  validates_presence_of :credit_card_number
  validates_presence_of :result

  scope :failed, -> { where(result: "failed") }
end
