require 'rails_helper'

RSpec.describe "InvoiceItems::InvoicesController Endpoint" do

  before(:each) do
    @invoice_items = create_list(:invoice_item, 3)
    @invoice_item  = @invoice_items.first
    @invoice       = Invoice.find(@invoice_item.invoice_id)
  end

  describe "GET items::invoice_items#index" do
    it "returns http success" do
      get "/api/v1/invoice_items/#{@invoice_item.id}/invoice"
      expect(response).to have_http_status(:success)
    end

    it "returns all invoice_items with /invoice_items" do
      get "/api/v1/invoice_items/#{@invoice_item.id}/invoice"

      results = JSON.parse(body)
      expect(results).to eq({
        'id'          => @invoice.id,
        'customer_id' => @invoice.customer_id,
        'merchant_id' => @invoice.merchant_id,
        'status'      => @invoice.status
      })
    end
  end
end
