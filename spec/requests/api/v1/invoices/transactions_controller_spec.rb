require 'rails_helper'

RSpec.describe "Invoices::TransactionsController Endpoint" do

  before(:each) do
    @transaction = create(:transaction)
    @invoice     = Invoice.find(@transaction.invoice_id)
  end

  describe "GET invoices::transactions#show" do
    it "returns http success" do
      get "/api/v1/invoices/#{@invoice.id}/transactions"
      expect(response).to have_http_status(:success)
    end

    it "returns the item's merchant" do
      get "/api/v1/invoices/#{@invoice.id}/transactions"

      results = JSON.parse(body)
      expect(results.count).to eq(1)
      invoice_json = results.first
      expect(invoice_json).to eq({
        'id'                 => @transaction.id,
        'invoice_id'         => @transaction.invoice_id,
        'credit_card_number' => @transaction.credit_card_number,
        'result'             => @transaction.result
      })
    end
  end
end
