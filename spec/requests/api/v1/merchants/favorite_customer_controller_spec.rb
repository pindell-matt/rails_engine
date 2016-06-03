require 'rails_helper'

RSpec.describe "Merchants::FavoriteCustomerController" do

  describe "GET invoices#index" do
    it "returns http success" do
      merchant = create(:merchant_with_items)
      get "/api/v1/merchants/#{merchant.id}/invoices"
      expect(response).to have_http_status(:success)
    end
  end

end
