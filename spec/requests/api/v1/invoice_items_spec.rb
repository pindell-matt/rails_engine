require 'rails_helper'

RSpec.describe "Invoice Items Record Endpoint" do

  before(:each) do
    @invoice_items = create_list(:invoice_item, 3)
    @invoice_item  = @invoice_items.first
    @unit_price    = (@invoice_item.unit_price / 100.00).to_s
  end

  it "returns all invoice_items with /invoice_items" do
    get '/api/v1/invoice_items'

    results = JSON.parse(body)
    expect(results.count).to eq(3)
    invoice_json = results.first
    expect(invoice_json).to eq({
      'id'         => @invoice_item.id,
      'invoice_id' => @invoice_item.invoice_id,
      'item_id'    => @invoice_item.item_id,
      'quantity'   => @invoice_item.quantity,
      'unit_price' => @unit_price,
    })
  end

  it "returns individual invoice with /invoice_items/:id" do
    get "/api/v1/invoice_items/#{@invoice_item.id}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'         => @invoice_item.id,
      'invoice_id' => @invoice_item.invoice_id,
      'item_id'    => @invoice_item.item_id,
      'quantity'   => @invoice_item.quantity,
      'unit_price' => @unit_price,
    })
  end

  it "can find an invoice based on id" do
    get "/api/v1/invoice_items/find?id=#{@invoice_item.id}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'         => @invoice_item.id,
      'invoice_id' => @invoice_item.invoice_id,
      'item_id'    => @invoice_item.item_id,
      'quantity'   => @invoice_item.quantity,
      'unit_price' => @unit_price,
    })
  end

  it "can find an invoice based on quantity" do
    get "/api/v1/invoice_items/find?quantity=#{@invoice_item.quantity}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'         => @invoice_item.id,
      'invoice_id' => @invoice_item.invoice_id,
      'item_id'    => @invoice_item.item_id,
      'quantity'   => @invoice_item.quantity,
      'unit_price' => @unit_price,
    })
  end

  it "can find an invoice based on unit_price" do
    get "/api/v1/invoice_items/find?unit_price=#{@unit_price}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'         => @invoice_item.id,
      'invoice_id' => @invoice_item.invoice_id,
      'item_id'    => @invoice_item.item_id,
      'quantity'   => @invoice_item.quantity,
      'unit_price' => @unit_price,
    })
  end

  it "can find an invoice based on invoice_id" do
    get "/api/v1/invoice_items/find?invoice_id=#{@invoice_item.invoice_id}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'         => @invoice_item.id,
      'invoice_id' => @invoice_item.invoice_id,
      'item_id'    => @invoice_item.item_id,
      'quantity'   => @invoice_item.quantity,
      'unit_price' => @unit_price,
    })
  end

  it "can find an invoice based on created_at" do
    get "/api/v1/invoice_items/find?created_at=#{@invoice_item.created_at}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'         => @invoice_item.id,
      'invoice_id' => @invoice_item.invoice_id,
      'item_id'    => @invoice_item.item_id,
      'quantity'   => @invoice_item.quantity,
      'unit_price' => @unit_price,
    })
  end

  it "can find an invoice based on updated_at" do
    get "/api/v1/invoice_items/find?updated_at=#{@invoice_item.updated_at}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'         => @invoice_item.id,
      'invoice_id' => @invoice_item.invoice_id,
      'item_id'    => @invoice_item.item_id,
      'quantity'   => @invoice_item.quantity,
      'unit_price' => @unit_price,
    })
  end

  it "can find all based on id" do
    get "/api/v1/invoice_items/find_all?id=#{@invoice_item.id}"

    results = JSON.parse(body)
    expect(results.count).to eq(1)
    invoice_json = results.first
    expect(invoice_json).to eq({
      'id'         => @invoice_item.id,
      'invoice_id' => @invoice_item.invoice_id,
      'item_id'    => @invoice_item.item_id,
      'quantity'   => @invoice_item.quantity,
      'unit_price' => @unit_price,
    })
  end

  it "can find all based on quantity" do
    get "/api/v1/invoice_items/find_all?quantity=#{@invoice_item.quantity}"

    results = JSON.parse(body)
    expect(results.count).to eq(3)
    invoice_json = results.first
    expect(invoice_json).to eq({
      'id'         => @invoice_item.id,
      'invoice_id' => @invoice_item.invoice_id,
      'item_id'    => @invoice_item.item_id,
      'quantity'   => @invoice_item.quantity,
      'unit_price' => @unit_price,
    })
  end

  it "can find all based on unit_price" do
    get "/api/v1/invoice_items/find_all?unit_price=#{@unit_price}"

    results = JSON.parse(body)
    expect(results.count).to eq(3)
    invoice_json = results.first
    expect(invoice_json).to eq({
      'id'         => @invoice_item.id,
      'invoice_id' => @invoice_item.invoice_id,
      'item_id'    => @invoice_item.item_id,
      'quantity'   => @invoice_item.quantity,
      'unit_price' => @unit_price,
    })
  end

  it "can find all based on item_id" do
    get "/api/v1/invoice_items/find_all?item_id=#{@invoice_item.item_id}"

    results = JSON.parse(body)
    expect(results.count).to eq(1)
    invoice_json = results.first
    expect(invoice_json).to eq({
      'id'         => @invoice_item.id,
      'invoice_id' => @invoice_item.invoice_id,
      'item_id'    => @invoice_item.item_id,
      'quantity'   => @invoice_item.quantity,
      'unit_price' => @unit_price,
    })
  end

  it "can find all based on invoice_id" do
    get "/api/v1/invoice_items/find_all?invoice_id=#{@invoice_item.invoice_id}"

    results = JSON.parse(body)
    expect(results.count).to eq(1)
    invoice_json = results.first
    expect(invoice_json).to eq({
      'id'         => @invoice_item.id,
      'invoice_id' => @invoice_item.invoice_id,
      'item_id'    => @invoice_item.item_id,
      'quantity'   => @invoice_item.quantity,
      'unit_price' => @unit_price,
    })
  end

  it "can find all based on created_at" do
    get "/api/v1/invoice_items/find_all?created_at=#{@invoice_item.created_at}"

    results = JSON.parse(body)
    expect(results.count).to eq(3)
    invoice_json = results.first
    expect(invoice_json).to eq({
      'id'         => @invoice_item.id,
      'invoice_id' => @invoice_item.invoice_id,
      'item_id'    => @invoice_item.item_id,
      'quantity'   => @invoice_item.quantity,
      'unit_price' => @unit_price,
    })
  end

  it "can find all based on updated_at" do
    get "/api/v1/invoice_items/find_all?updated_at=#{@invoice_item.updated_at}"

    results = JSON.parse(body)
    expect(results.count).to eq(3)
    invoice_json = results.first
    expect(invoice_json).to eq({
      'id'         => @invoice_item.id,
      'invoice_id' => @invoice_item.invoice_id,
      'item_id'    => @invoice_item.item_id,
      'quantity'   => @invoice_item.quantity,
      'unit_price' => @unit_price,
    })
  end

  it "can return a random invoice" do
    get "/api/v1/invoice_items/random"

    results = JSON.parse(body)
    expect(results.has_key?("id"))
    expect(results.has_key?("merchant_id"))
    expect(results.has_key?("customer_id"))
    expect(results.has_key?("status"))
  end
end
