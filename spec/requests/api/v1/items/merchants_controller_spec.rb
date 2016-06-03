require 'rails_helper'

RSpec.describe "Items::MerchantsController Endpoint" do

  before(:each) do
    @merchant = create(:merchant_with_items)
    @item     = @merchant.items.first
  end

  describe "GET items::merchants#show" do
    it "returns http success" do
      get "/api/v1/items/#{@item.id}/merchant"
      expect(response).to have_http_status(:success)
    end

    it "returns the item's merchant" do
      get "/api/v1/items/#{@item.id}/merchant"
      results = JSON.parse(body)
      expect(results).to eq({
        'id'   => @merchant.id,
        'name' => @merchant.name
      })
    end
  end
end
