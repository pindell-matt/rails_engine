require 'rails_helper'

RSpec.describe "Invoices::MerchantsController Endpoint" do

  before(:each) do
    @invoice  = create(:invoice)
    @merchant = Merchant.find(@invoice.merchant_id)
  end

  describe "GET invoices::merchants#show" do
    it "returns http success" do
      get "/api/v1/invoices/#{@invoice.id}/merchant"
      expect(response).to have_http_status(:success)
    end

    it "returns the item's merchant" do
      get "/api/v1/invoices/#{@invoice.id}/merchant"

      result = JSON.parse(body)
      expect(result).to eq({
        'id'   => @merchant.id,
        'name' => @merchant.name
      })
    end
  end
end
