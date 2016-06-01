require 'rails_helper'

RSpec.describe "Item Record Endpoint" do

  before(:each) do
    @items = create_list(:item, 3)
    @item  = @items.first
  end

  it "returns all items with /items" do
    get '/api/v1/items'

    results = JSON.parse(body)
    expect(results.count).to eq(3)
    item_json = results.first
    expect(item_json).to eq({
      'id'          => @item.id,
      'name'        => @item.name,
      'description' => @item.description,
      'unit_price'  => @item.unit_price,
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
      'unit_price'  => @item.unit_price,
      'merchant_id' => @item.merchant_id
    })
  end

  xit "can find a item based on id" do
    get "/api/v1/items/find?id=#{@item.id}"

    results = JSON.parse(body)
    expect(results["id"]).to        eq(@item.id)
    expect(results["full_name"]).to eq([@item.first_name, @item.last_name].join(" "))
  end

  xit "can find a item based on first_name" do
    get "/api/v1/items/find?first_name=#{@item.first_name}"

    results = JSON.parse(body)
    expect(results["id"]).to        eq(@item.id)
    expect(results["full_name"]).to eq([@item.first_name, @item.last_name].join(" "))
  end

  xit "can find a item based on last_name" do
    get "/api/v1/items/find?last_name=#{@item.last_name}"

    results = JSON.parse(body)
    expect(results["id"]).to        eq(@item.id)
    expect(results["full_name"]).to eq([@item.first_name, @item.last_name].join(" "))
  end

  xit "can find a item based on created_at" do
    get "/api/v1/items/find?created_at=#{@item.created_at}"

    results = JSON.parse(body)
    expect(results["id"]).to        eq(@item.id)
    expect(results["full_name"]).to eq([@item.first_name, @item.last_name].join(" "))
  end

  xit "can find a item based on updated_at" do
    get "/api/v1/items/find?updated_at=#{@item.updated_at}"

    results = JSON.parse(body)
    expect(results["id"]).to        eq(@item.id)
    expect(results["full_name"]).to eq([@item.first_name, @item.last_name].join(" "))
  end

  xit "can find all based on first_name" do
    get "/api/v1/items/find_all?first_name=#{@item.first_name}"

    results = JSON.parse(body)
    expect(results.count).to eq(1)
    item_json = results.first
    expect(item_json).to eq({
      'id'         => @item.id,
      'full_name'  => [@item.first_name, @item.last_name].join(" ")
    })
  end

  xit "can find all based on last_name" do
    get "/api/v1/items/find_all?last_name=#{@item.last_name}"

    results = JSON.parse(body)
    expect(results.count).to eq(1)
    item_json = results.first
    expect(item_json).to eq({
      'id'         => @item.id,
      'full_name'  => [@item.first_name, @item.last_name].join(" ")
    })
  end

  xit "can find all based on created_at" do
    get "/api/v1/items/find_all?created_at=#{@item.created_at}"

    results = JSON.parse(body)
    expect(results.count).to eq(3)
    item_json = results.first
    expect(item_json).to eq({
      'id'         => @item.id,
      'full_name'  => [@item.first_name, @item.last_name].join(" ")
    })
  end

  xit "can find all based on updated_at" do
    get "/api/v1/items/find_all?updated_at=#{@item.updated_at}"

    results = JSON.parse(body)
    expect(results.count).to eq(3)
    item_json = results.first
    expect(item_json).to eq({
      'id'         => @item.id,
      'full_name'  => [@item.first_name, @item.last_name].join(" ")
    })
  end

  xit "can return a random item" do
    get "/api/v1/items/random"

    results = JSON.parse(body)
    expect(results.has_key?("id"))
    expect(results.has_key?("full_name"))
  end
end
