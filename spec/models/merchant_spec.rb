require 'rails_helper'

describe Merchant do
  it { should have_many(:items) }
  it { should have_many(:invoices) }
  it { should validate_presence_of(:name) }
end
