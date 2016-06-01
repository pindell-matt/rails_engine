require 'rails_helper'

RSpec.describe "Merchants::ItemsController" do

  describe "GET #index" do
    it "returns http success" do
      merchant = create(:merchant_with_items)
      get "/api/v1/merchants/#{merchant.id}/items"
      expect(response).to have_http_status(:success)
    end
  end

end
