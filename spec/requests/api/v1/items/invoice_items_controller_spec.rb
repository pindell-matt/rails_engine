require 'rails_helper'

RSpec.describe "Items::InvoiceItemsController Endpoint" do

  before(:each) do
    @invoice_item = create(:invoice_item)
    @item         = Item.find(@invoice_item.item_id)
    @unit_price   = (@invoice_item.unit_price / 100.00).to_s
  end

  describe "GET items::invoice_items#index" do
    it "returns http success" do
      get "/api/v1/items/#{@item.id}/invoice_items"
      expect(response).to have_http_status(:success)
    end

    it "returns the item's invoice_items" do
      get "/api/v1/items/#{@item.id}/invoice_items"
      results = JSON.parse(body)

      expect(results.count).to eq(1)
      invoice_json = results.first
      expect(invoice_json).to eq({
        'id'         => @invoice_item.id,
        'invoice_id' => @invoice_item.invoice_id,
        'item_id'    => @invoice_item.item_id,
        'quantity'   => @invoice_item.quantity,
        'unit_price' => @unit_price
      })
    end
  end
end
