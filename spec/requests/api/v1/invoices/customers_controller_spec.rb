require 'rails_helper'

RSpec.describe "Invoices::CustomersController Endpoint" do

  before(:each) do
    @invoice  = create(:invoice)
    @customer = Customer.find(@invoice.customer_id)
  end

  describe "GET invoices::customers#show" do
    it "returns http success" do
      get "/api/v1/invoices/#{@invoice.id}/customer"
      expect(response).to have_http_status(:success)
    end

    it "returns all customer with /customer" do
      get "/api/v1/invoices/#{@invoice.id}/customer"

      result = JSON.parse(body)
      expect(result).to eq({
        'id'         => @customer.id,
        'first_name' => @customer.first_name,
        'last_name'  => @customer.last_name
      })
    end
  end
end
