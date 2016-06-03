require 'rails_helper'

RSpec.describe "Transactions::InvoicesController Endpoint" do

  before(:each) do
    @transaction = create(:transaction)
    @invoice     = @transaction.invoice
  end

  describe "GET transactions::invoices#index" do
    it "returns http success" do
      get "/api/v1/transactions/#{@transaction.id}/invoice"
      expect(response).to have_http_status(:success)
    end

    it "returns all invoices" do
      get "/api/v1/transactions/#{@transaction.id}/invoice"

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
