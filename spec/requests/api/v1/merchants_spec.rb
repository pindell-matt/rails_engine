require 'rails_helper'

RSpec.describe "Merchant Record Endpoint" do

  before(:each) do
    @merchants = create_list(:merchant_with_items, 3)
    @merchant  = @merchants[1]
  end

  it "returns all merchants with /merchants" do
    get '/api/v1/merchants'

    results = JSON.parse(body)

    expect(results.count).to eq(3)
    merchant_json = results[1]
    expect(merchant_json).to eq({
      'id'   => @merchant.id,
      'name' => @merchant.name
    })
  end

  it "returns individual merchant with /merchants/:id" do
    get "/api/v1/merchants/#{@merchant.id}"

    results = JSON.parse(body)
    expect(results["id"]).to   eq(@merchant.id)
    expect(results["name"]).to eq(@merchant.name)
  end

  it "can find a merchant based on id" do
    get "/api/v1/merchants/find?id=#{@merchant.id}"

    results = JSON.parse(body)
    expect(results["id"]).to   eq(@merchant.id)
    expect(results["name"]).to eq(@merchant.name)
  end

  it "can find a merchant based on name" do
    get "/api/v1/merchants/find?name=#{@merchant.name}"

    results = JSON.parse(body)
    expect(results["id"]).to   eq(@merchant.id)
    expect(results["name"]).to eq(@merchant.name)
  end

  it "can find a merchant based on created_at" do
    time = @merchant.created_at.to_json.gsub("\"", "")
    get "/api/v1/merchants/find?created_at=#{time}"

    results = JSON.parse(body)
    expect(results["id"]).to   eq(@merchant.id)
    expect(results["name"]).to eq(@merchant.name)
  end
end
