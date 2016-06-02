class Transaction < ActiveRecord::Base
  belongs_to :invoice

  validates_presence_of :credit_card_number
  validates_presence_of :result

  enum status: %w(success failed)
end
