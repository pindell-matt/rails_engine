require 'rails_helper'

describe Merchant do
  it { should have_many :items }
  it { should have_many :invoices }
  it { should validate_presence_of :name }

  it "has a valid factory" do
    merchant = create(:merchant)
    expect(merchant).to be_valid
  end

  it "has items" do
    merchant = create(:merchant_with_items)
    items    = merchant.items
    item     = items.first

    expect(items.count).to eq(5)
    expect(item).to be_valid
  end

end
