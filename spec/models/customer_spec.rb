require 'rails_helper'

describe Customer do
  it { should have_many :invoices }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }

  it "has a valid factory" do
    customer = create(:customer)
    expect(customer).to be_valid
  end

  it "is invalid without a first_name" do
    customer = build(:customer, first_name: nil)
    expect(customer).to_not be_valid
  end

  it "is invalid without a last_name" do
    customer = build(:customer, last_name: nil)
    expect(customer).to_not be_valid
  end

end
