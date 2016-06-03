require 'rails_helper'

RSpec.describe "Invoices::ItemsController Endpoint" do

  before(:each) do
    invoice_item = create(:invoice_item)
    @invoice     = Invoice.find(invoice_item.invoice_id)
    @item        = Item.find(invoice_item.item_id)
    @unit_price  = (@item.unit_price / 100.00).to_s
  end

  describe "GET invoices::items#index" do
    it "returns http success" do
      get "/api/v1/invoices/#{@invoice.id}/items"
      expect(response).to have_http_status(:success)
    end

    it "returns all items with /items" do
      get "/api/v1/invoices/#{@invoice.id}/items"

      results = JSON.parse(body)
      result  = results.first
      expect(result).to eq({
        'id'          => @item.id,
        'name'        => @item.name,
        'description' => @item.description,
        'unit_price'  => @unit_price,
        'merchant_id' => @item.merchant_id
      })
    end
  end
end
