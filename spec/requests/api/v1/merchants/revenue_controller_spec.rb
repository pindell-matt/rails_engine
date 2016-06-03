require 'rails_helper'

RSpec.describe "Merchants::RevenueController" do

  before(:each) do
    transaction = create(:transaction)
    invoice     = transaction.invoice
    invoice.update_attributes(status: "pending")
    @merchant    = Merchant.find(invoice.merchant_id)
    @date        = transaction.created_at
    invoice_items = create(:invoice_item, invoice_id: invoice.id)
  end

  describe "GET revenue#index" do
    it "returns http success" do
      get "/api/v1/merchants/revenue?date=#{@date}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET revenue#show" do
    it "returns http success" do
      get "/api/v1/merchants/#{@merchant.id}/revenue"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET revenue#show" do
    it "returns http success" do
      get "/api/v1/merchants/#{@merchant.id}/revenue?date=#{@date}"
      expect(response).to have_http_status(:success)
    end
  end
end
