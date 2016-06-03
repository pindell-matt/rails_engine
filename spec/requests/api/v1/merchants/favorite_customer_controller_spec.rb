require 'rails_helper'

RSpec.describe "Merchants::FavoriteCustomerController" do

  before(:each) do
    @merchant = create(:merchant_with_invoices)
    @customer = Customer.first
  end

  describe "GET invoices#index" do
    it "returns http success" do
      get "/api/v1/merchants/#{@merchant.id}/favorite_customer"
      expect(response).to have_http_status(:success)
    end
  end

end
