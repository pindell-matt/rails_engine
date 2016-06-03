require 'rails_helper'

RSpec.describe "Merchants::InvoicesController" do

  before(:each) do
    @merchant = create(:merchant_with_invoices)
  end

  describe "GET invoices#index" do
    it "returns http success" do
      get "/api/v1/merchants/#{@merchant.id}/invoices"
      expect(response).to have_http_status(:success)
    end

    it "returns http success" do
      get "/api/v1/merchants/#{@merchant.id}/invoices"

      results = JSON.parse(body)
      expect(results.count).to eq(3)
      invoice      = @merchant.invoices.first
      invoice_json = results.first
      expect(invoice_json).to eq({
        'id'          => invoice.id,
        'customer_id' => invoice.customer_id,
        'merchant_id' => invoice.merchant_id,
        'status'      => invoice.status
      })
    end
  end

end
