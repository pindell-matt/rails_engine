require 'rails_helper'

describe Customer do
  it { should have_many :invoices }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
end
