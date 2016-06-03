require 'rails_helper'

RSpec.describe "Merchants::PendingInvoicesController" do

  before(:each) do
    transaction = create(:transaction)
    invoice     = transaction.invoice
    invoice.update_attributes(status: "pending")
    @merchant    = Merchant.find(invoice.merchant_id)
    invoice_items = create(:invoice_item, invoice_id: invoice.id)
  end

  describe "GET pending_invoices#index" do
    it "returns http success" do
      get "/api/v1/merchants/#{@merchant.id}/customers_with_pending_invoices"
      expect(response).to have_http_status(:success)
    end
  end
end
