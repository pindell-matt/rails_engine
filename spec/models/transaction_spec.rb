require 'rails_helper'

describe Transaction do
  it { should belong_to :invoice }
  it { should validate_presence_of :credit_card_number }
  it { should validate_presence_of :credit_card_expiration_date }
  it { should validate_presence_of :result }
end
