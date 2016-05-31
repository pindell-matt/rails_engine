require 'rails_helper'

describe Item do
  it { should belong_to :merchant }
  it { should have_many :invoice_items }
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :unit_price }
end
