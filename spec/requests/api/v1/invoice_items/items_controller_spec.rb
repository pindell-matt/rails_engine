require 'rails_helper'

RSpec.describe "InvoiceItems::ItemsController Endpoint" do

  before(:each) do
    @invoice_item  = create(:invoice_item)
    @item          = Item.find(@invoice_item.invoice_id)
    @unit_price    = (@item.unit_price / 100.00).to_s
  end

  describe "GET invoice_items::items#show" do
    it "returns http success" do
      get "/api/v1/invoice_items/#{@invoice_item.id}/item"
      expect(response).to have_http_status(:success)
    end

    it "returns all items with /items" do
      get "/api/v1/invoice_items/#{@invoice_item.id}/item"

      result = JSON.parse(body)
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
