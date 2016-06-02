require 'rails_helper'

RSpec.describe "Item Record Endpoint" do

  before(:each) do
    merchant = create(:merchant_with_items)
    @items   = merchant.items
    @item    = @items.first
    # refactor
    @unit_price = (@item.unit_price / 100.00).to_s
  end

  it "returns all items with /items" do
    get '/api/v1/items'

    results = JSON.parse(body)
    expect(results.count).to eq(5)
    item_json = results.first
    expect(item_json).to eq({
      'id'          => @item.id,
      'name'        => @item.name,
      'description' => @item.description,
      'unit_price'  => @unit_price,
      'merchant_id' => @item.merchant_id
    })
  end

  it "returns individual item with /items/:id" do
    get "/api/v1/items/#{@item.id}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'          => @item.id,
      'name'        => @item.name,
      'description' => @item.description,
      'unit_price'  => @unit_price,
      'merchant_id' => @item.merchant_id
    })
  end

  it "can find an item based on id" do
    get "/api/v1/items/find?id=#{@item.id}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'          => @item.id,
      'name'        => @item.name,
      'description' => @item.description,
      'unit_price'  => @unit_price,
      'merchant_id' => @item.merchant_id
    })
  end

  it "can find an item based on name" do
    get "/api/v1/items/find?name=#{@item.name}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'          => @item.id,
      'name'        => @item.name,
      'description' => @item.description,
      'unit_price'  => @unit_price,
      'merchant_id' => @item.merchant_id
    })
  end

  it "can find an item based on description" do
    get "/api/v1/items/find?description=#{@item.description}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'          => @item.id,
      'name'        => @item.name,
      'description' => @item.description,
      'unit_price'  => @unit_price,
      'merchant_id' => @item.merchant_id
    })
  end

  it "can find an item based on unit_price" do
    get "/api/v1/items/find?unit_price=#{@unit_price}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'          => @item.id,
      'name'        => @item.name,
      'description' => @item.description,
      'unit_price'  => @unit_price,
      'merchant_id' => @item.merchant_id
    })
  end

  it "can find an item based on merchant_id" do
    get "/api/v1/items/find?merchant_id=#{@item.merchant_id}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'          => @items.last.id,
      'name'        => @items.last.name,
      'description' => @items.last.description,
      'unit_price'  => @items.last.unit_price,
      'merchant_id' => @items.last.merchant_id
    })
  end

  it "can find an item based on created_at" do
    get "/api/v1/items/find?created_at=#{@item.created_at}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'          => @item.id,
      'name'        => @item.name,
      'description' => @item.description,
      'unit_price'  => @unit_price,
      'merchant_id' => @item.merchant_id
    })
  end

  it "can find an item based on updated_at" do
    get "/api/v1/items/find?updated_at=#{@item.updated_at}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'          => @item.id,
      'name'        => @item.name,
      'description' => @item.description,
      'unit_price'  => @unit_price,
      'merchant_id' => @item.merchant_id
    })
  end

  it "can find all based on name" do
    get "/api/v1/items/find_all?name=#{@item.name}"

    results = JSON.parse(body)
    expect(results.count).to eq(1)
    item_json = results.first
    expect(item_json).to eq({
      'id'          => @item.id,
      'name'        => @item.name,
      'description' => @item.description,
      'unit_price'  => @unit_price,
      'merchant_id' => @item.merchant_id
    })
  end

  it "can find all based on description" do
    get "/api/v1/items/find_all?description=#{@item.description}"

    results = JSON.parse(body)
    expect(results.count).to eq(1)
    item_json = results.first
    expect(item_json).to eq({
      'id'          => @item.id,
      'name'        => @item.name,
      'description' => @item.description,
      'unit_price'  => @unit_price,
      'merchant_id' => @item.merchant_id
    })
  end

  it "can find all based on unit_price" do
    get "/api/v1/items/find_all?unit_price=#{@unit_price}"

    results = JSON.parse(body)
    expect(results.count).to eq(1)
    item_json = results.first
    expect(item_json).to eq({
      'id'          => @item.id,
      'name'        => @item.name,
      'description' => @item.description,
      'unit_price'  => @unit_price,
      'merchant_id' => @item.merchant_id
    })
  end

  it "can find all based on merchant_id" do
    get "/api/v1/items/find_all?merchant_id=#{@item.merchant_id}"

    results = JSON.parse(body)
    expect(results.count).to eq(5)
    item_json = results.first
    expect(item_json).to eq({
      'id'          => @item.id,
      'name'        => @item.name,
      'description' => @item.description,
      'unit_price'  => @unit_price,
      'merchant_id' => @item.merchant_id
    })
  end

  it "can find all based on created_at" do
    get "/api/v1/items/find_all?created_at=#{@item.created_at}"

    results = JSON.parse(body)
    expect(results.count).to eq(5)
    item_json = results.first
    expect(item_json).to eq({
      'id'          => @item.id,
      'name'        => @item.name,
      'description' => @item.description,
      'unit_price'  => @unit_price,
      'merchant_id' => @item.merchant_id
    })
  end

  it "can find all based on updated_at" do
    get "/api/v1/items/find_all?updated_at=#{@item.updated_at}"

    results = JSON.parse(body)
    expect(results.count).to eq(5)
    item_json = results.first
    expect(item_json).to eq({
      'id'          => @item.id,
      'name'        => @item.name,
      'description' => @item.description,
      'unit_price'  => @unit_price,
      'merchant_id' => @item.merchant_id
    })
  end

  it "can return a random item" do
    get "/api/v1/items/random"

    results = JSON.parse(body)
    expect(results.has_key?("id"))
    expect(results.has_key?("name"))
    expect(results.has_key?("decription"))
    expect(results.has_key?("unit_price"))
    expect(results.has_key?("merchant_id"))
  end
end
