require 'rails_helper'

RSpec.describe "Item Record Endpoint" do

  before(:each) do
    3.times do
      create(:invoice, merchant_id: create(:merchant).id, customer_id: create(:customer).id)
    end

    @invoices = Invoice.all
    @invoice  = @invoices.first
  end

  it "returns all invoices with /invoices" do
    get '/api/v1/invoices'

    results = JSON.parse(body)
    expect(results.count).to eq(3)
    invoice_json = results.first
    expect(invoice_json).to eq({
      'id'          => @invoice.id,
      'customer_id' => @invoice.customer_id,
      'merchant_id' => @invoice.merchant_id,
      'status'      => @invoice.status
    })
  end

  it "returns individual invoice with /invoices/:id" do
    get "/api/v1/invoices/#{@invoice.id}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'          => @invoice.id,
      'customer_id' => @invoice.customer_id,
      'merchant_id' => @invoice.merchant_id,
      'status'      => @invoice.status
    })
  end

  it "can find an invoice based on id" do
    get "/api/v1/invoices/find?id=#{@invoice.id}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'          => @invoice.id,
      'customer_id' => @invoice.customer_id,
      'merchant_id' => @invoice.merchant_id,
      'status'      => @invoice.status
    })
  end

  it "can find an invoice based on status" do
    get "/api/v1/invoices/find?status=#{@invoice.status}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'          => @invoice.id,
      'customer_id' => @invoice.customer_id,
      'merchant_id' => @invoice.merchant_id,
      'status'      => @invoice.status
    })
  end

  it "can find an invoice based on merchant_id" do
    get "/api/v1/invoices/find?merchant_id=#{@invoice.merchant_id}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'          => @invoice.id,
      'customer_id' => @invoice.customer_id,
      'merchant_id' => @invoice.merchant_id,
      'status'      => @invoice.status
    })
  end

  it "can find an invoice based on created_at" do
    get "/api/v1/invoices/find?created_at=#{@invoice.created_at}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'          => @invoice.id,
      'customer_id' => @invoice.customer_id,
      'merchant_id' => @invoice.merchant_id,
      'status'      => @invoice.status
    })
  end

  it "can find an invoice based on updated_at" do
    get "/api/v1/invoices/find?updated_at=#{@invoice.updated_at}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'          => @invoice.id,
      'customer_id' => @invoice.customer_id,
      'merchant_id' => @invoice.merchant_id,
      'status'      => @invoice.status
    })
  end

  it "can find all based on id" do
    get "/api/v1/invoices/find_all?id=#{@invoice.id}"

    results = JSON.parse(body)
    expect(results.count).to eq(1)
    invoice_json = results.first
    expect(invoice_json).to eq({
      'id'          => @invoice.id,
      'customer_id' => @invoice.customer_id,
      'merchant_id' => @invoice.merchant_id,
      'status'      => @invoice.status
    })
  end

  it "can find all based on status" do
    get "/api/v1/invoices/find_all?status=#{@invoice.status}"

    results = JSON.parse(body)
    expect(results.count).to eq(3)
    invoice_json = results.first
    expect(invoice_json).to eq({
      'id'          => @invoice.id,
      'customer_id' => @invoice.customer_id,
      'merchant_id' => @invoice.merchant_id,
      'status'      => @invoice.status
    })
  end

  it "can find all based on customer_id" do
    get "/api/v1/invoices/find_all?customer_id=#{@invoice.customer_id}"

    results = JSON.parse(body)
    expect(results.count).to eq(3)
    invoice_json = results.first
    expect(invoice_json).to eq({
      'id'          => @invoice.id,
      'customer_id' => @invoice.customer_id,
      'merchant_id' => @invoice.merchant_id,
      'status'      => @invoice.status
    })
  end

  it "can find all based on merchant_id" do
    get "/api/v1/invoices/find_all?merchant_id=#{@invoice.merchant_id}"

    results = JSON.parse(body)
    expect(results.count).to eq(1)
    invoice_json = results.first
    expect(invoice_json).to eq({
      'id'          => @invoice.id,
      'customer_id' => @invoice.customer_id,
      'merchant_id' => @invoice.merchant_id,
      'status'      => @invoice.status
    })
  end

  it "can find all based on created_at" do
    get "/api/v1/invoices/find_all?created_at=#{@invoice.created_at}"

    results = JSON.parse(body)
    expect(results.count).to eq(3)
    invoice_json = results.first
    expect(invoice_json).to eq({
      'id'          => @invoice.id,
      'customer_id' => @invoice.customer_id,
      'merchant_id' => @invoice.merchant_id,
      'status'      => @invoice.status
    })
  end

  it "can find all based on updated_at" do
    get "/api/v1/invoices/find_all?updated_at=#{@invoice.updated_at}"

    results = JSON.parse(body)
    expect(results.count).to eq(3)
    invoice_json = results.first
    expect(invoice_json).to eq({
      'id'          => @invoice.id,
      'customer_id' => @invoice.customer_id,
      'merchant_id' => @invoice.merchant_id,
      'status'      => @invoice.status
    })
  end

  it "can return a random invoice" do
    get "/api/v1/invoices/random"

    results = JSON.parse(body)
    expect(results.has_key?("id"))
    expect(results.has_key?("merchant_id"))
    expect(results.has_key?("customer_id"))
    expect(results.has_key?("status"))
  end
end
