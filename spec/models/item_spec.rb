require 'rails_helper'

describe Item do
  it { should belong_to :merchant }
  it { should have_many :invoice_items }
end
