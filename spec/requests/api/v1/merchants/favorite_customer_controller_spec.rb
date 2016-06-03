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

    # it "returns the merchant's favorite customer" do
    #   get "/api/v1/merchants/#{@merchant.id}/favorite_customer"
    #
    #   results   = JSON.parse(body)
    #   require "pry"
    #   binding.pry
    #   cust_json = results.first
    #   expect(cust_json).to eq({
    #     'id'         => @customer.id,
    #     'first_name' => @customer.first_name,
    #     'last_name'  => @customer.last_name
    #   })
    # end
  end

end
