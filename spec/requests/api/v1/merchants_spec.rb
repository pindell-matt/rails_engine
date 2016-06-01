require 'rails_helper'

RSpec.describe "Merchant Record Endpoint" do
  it "returns all merchants with /merchants" do
    merchants = create_list(:merchant_with_items, 3)
    merchant  = merchants.first
    get '/api/v1/merchants'

    results = JSON.parse(body)

    expect(results.count).to eq(3)
    merchant_json = results[0]
    expect(merchant_json).to eq({
      'id'   => merchant.id,
      'name' => merchant.name
    })
  end

  it "returns individual merchant with /merchants/:id" do
    merchant = create(:merchant)
    get "/api/v1/merchants/#{merchant.id}"

    results = JSON.parse(body)
    expect(results["id"]).to   eq(merchant.id)
    expect(results["name"]).to eq(merchant.name)
  end
end
