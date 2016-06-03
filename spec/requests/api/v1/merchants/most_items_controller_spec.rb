require 'rails_helper'

RSpec.describe "Merchants::MostItemsController" do

  before(:each) do
    transaction = create(:transaction)
    invoice     = transaction.invoice
    @merchant    = Merchant.find(invoice.merchant_id)
    invoice_items = create(:invoice_item, invoice_id: invoice.id)
  end

  describe "GET most_items#index" do
    it "returns http success" do
      get "/api/v1/merchants/most_items?quantity=1"
      expect(response).to have_http_status(:success)
    end
  end

  #   it "returns the merchant's favorite customer" do
  #     get "/api/v1/merchants/most_items?quantity=1"
  #
  #     results   = JSON.parse(body)
  #     cust_json = results.first
  #     expect(cust_json).to eq({
  #       'id'         => @customer.id,
  #       'first_name' => @customer.first_name,
  #       'last_name'  => @customer.last_name
  #     })
  #   end
  # end

end
