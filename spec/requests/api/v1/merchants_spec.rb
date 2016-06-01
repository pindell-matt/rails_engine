require 'rails_helper'

RSpec.describe "Merchant Record Endpoint" do

  before(:each) do
    @merchants = create_list(:merchant_with_items, 3)
    @merchant  = @merchants.first
  end

  it "returns all merchants with /merchants" do
    get '/api/v1/merchants'

    results = JSON.parse(body)

    expect(results.count).to eq(3)
    merchant_json = results.first
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
    get "/api/v1/merchants/find?created_at=#{@merchant.created_at}"

    results = JSON.parse(body)
    expect(results["id"]).to   eq(@merchant.id)
    expect(results["name"]).to eq(@merchant.name)
  end

  it "can find a merchant based on updated_at" do
    get "/api/v1/merchants/find?updated_at=#{@merchant.updated_at}"

    results = JSON.parse(body)
    expect(results["id"]).to   eq(@merchant.id)
    expect(results["name"]).to eq(@merchant.name)
  end

  it "can find all based on name" do
    get "/api/v1/merchants/find_all?name=#{@merchant.name}"

    results = JSON.parse(body)
    expect(results.count).to eq(1)
    merchant_json = results.first
    expect(merchant_json).to eq({
      'id'   => @merchant.id,
      'name' => @merchant.name
    })
  end

  it "can find all based on created_at" do
    get "/api/v1/merchants/find_all?created_at=#{@merchant.created_at}"

    results = JSON.parse(body)
    expect(results.count).to eq(3)
    merchant_json = results.first
    expect(merchant_json).to eq({
      'id'   => @merchant.id,
      'name' => @merchant.name
    })
  end

  it "can find all based on updated_at" do
    get "/api/v1/merchants/find_all?updated_at=#{@merchant.updated_at}"

    results = JSON.parse(body)
    expect(results.count).to eq(3)
    merchant_json = results.first
    expect(merchant_json).to eq({
      'id'   => @merchant.id,
      'name' => @merchant.name
    })
  end

  it "can return a random merchant" do
    get "/api/v1/merchants/random"

    results = JSON.parse(body)
    expect(results.has_key?("id"))
    expect(results.has_key?("name"))
  end
end
