require 'rails_helper'

RSpec.describe "Transaction Record Endpoint" do

  before(:each) do
    @transactions = create_list(:transaction, 3)
    @transaction  = @transactions.first
  end

  it "returns all transactions with /transactions" do
    get '/api/v1/transactions'

    results = JSON.parse(body)
    expect(results.count).to eq(3)
    invoice_json = results.first
    expect(invoice_json).to eq({
      'id'                 => @transaction.id,
      'invoice_id'         => @transaction.invoice_id,
      'credit_card_number' => @transaction.credit_card_number,
      'result'             => @transaction.result
    })
  end

  it "returns individual invoice with /transactions/:id" do
    get "/api/v1/transactions/#{@transaction.id}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'                 => @transaction.id,
      'invoice_id'         => @transaction.invoice_id,
      'credit_card_number' => @transaction.credit_card_number,
      'result'             => @transaction.result
    })
  end

  it "can find an invoice based on id" do
    get "/api/v1/transactions/find?id=#{@transaction.id}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'                 => @transaction.id,
      'invoice_id'         => @transaction.invoice_id,
      'credit_card_number' => @transaction.credit_card_number,
      'result'             => @transaction.result
    })
  end

  it "can find an invoice based on result" do
    get "/api/v1/transactions/find?result=#{@transaction.result}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'                 => @transaction.id,
      'invoice_id'         => @transaction.invoice_id,
      'credit_card_number' => @transaction.credit_card_number,
      'result'             => @transaction.result
    })
  end

  it "can find an invoice based on credit_card_number" do
    get "/api/v1/transactions/find?credit_card_number=#{@transaction.credit_card_number}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'                 => @transaction.id,
      'invoice_id'         => @transaction.invoice_id,
      'credit_card_number' => @transaction.credit_card_number,
      'result'             => @transaction.result
    })
  end

  it "can find an invoice based on invoice_id" do
    get "/api/v1/transactions/find?invoice_id=#{@transaction.invoice_id}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'                 => @transaction.id,
      'invoice_id'         => @transaction.invoice_id,
      'credit_card_number' => @transaction.credit_card_number,
      'result'             => @transaction.result
    })
  end

  it "can find an invoice based on created_at" do
    get "/api/v1/transactions/find?created_at=#{@transaction.created_at}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'                 => @transaction.id,
      'invoice_id'         => @transaction.invoice_id,
      'credit_card_number' => @transaction.credit_card_number,
      'result'             => @transaction.result
    })
  end

  it "can find an invoice based on updated_at" do
    get "/api/v1/transactions/find?updated_at=#{@transaction.updated_at}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'                 => @transaction.id,
      'invoice_id'         => @transaction.invoice_id,
      'credit_card_number' => @transaction.credit_card_number,
      'result'             => @transaction.result
    })
  end

  it "can find all based on id" do
    get "/api/v1/transactions/find_all?id=#{@transaction.id}"

    results = JSON.parse(body)
    expect(results.count).to eq(1)
    invoice_json = results.first
    expect(invoice_json).to eq({
      'id'                 => @transaction.id,
      'invoice_id'         => @transaction.invoice_id,
      'credit_card_number' => @transaction.credit_card_number,
      'result'             => @transaction.result
    })
  end

  it "can find all based on result" do
    get "/api/v1/transactions/find_all?result=#{@transaction.result}"

    results = JSON.parse(body)
    expect(results.count).to eq(3)
    invoice_json = results.first
    expect(invoice_json).to eq({
      'id'                 => @transaction.id,
      'invoice_id'         => @transaction.invoice_id,
      'credit_card_number' => @transaction.credit_card_number,
      'result'             => @transaction.result
    })
  end

  it "can find all based on credit_card_number" do
    get "/api/v1/transactions/find_all?credit_card_number=#{@transaction.credit_card_number}"

    results = JSON.parse(body)
    expect(results.count).to eq(3)
    invoice_json = results.first
    expect(invoice_json).to eq({
      'id'                 => @transaction.id,
      'invoice_id'         => @transaction.invoice_id,
      'credit_card_number' => @transaction.credit_card_number,
      'result'             => @transaction.result
    })
  end

  it "can find all based on credit_card_number" do
    get "/api/v1/transactions/find_all?credit_card_number=#{@transaction.credit_card_number}"

    results = JSON.parse(body)
    expect(results.count).to eq(3)
    invoice_json = results.first
    expect(invoice_json).to eq({
      'id'                 => @transaction.id,
      'invoice_id'         => @transaction.invoice_id,
      'credit_card_number' => @transaction.credit_card_number,
      'result'             => @transaction.result
    })
  end

  it "can find all based on invoice_id" do
    get "/api/v1/transactions/find_all?invoice_id=#{@transaction.invoice_id}"

    results = JSON.parse(body)
    expect(results.count).to eq(1)
    invoice_json = results.first
    expect(invoice_json).to eq({
      'id'                 => @transaction.id,
      'invoice_id'         => @transaction.invoice_id,
      'credit_card_number' => @transaction.credit_card_number,
      'result'             => @transaction.result
    })
  end

  it "can find all based on created_at" do
    get "/api/v1/transactions/find_all?created_at=#{@transaction.created_at}"

    results = JSON.parse(body)
    expect(results.count).to eq(3)
    invoice_json = results.first
    expect(invoice_json).to eq({
      'id'                 => @transaction.id,
      'invoice_id'         => @transaction.invoice_id,
      'credit_card_number' => @transaction.credit_card_number,
      'result'             => @transaction.result
    })
  end

  it "can find all based on updated_at" do
    get "/api/v1/transactions/find_all?updated_at=#{@transaction.updated_at}"

    results = JSON.parse(body)
    expect(results.count).to eq(3)
    invoice_json = results.first
    expect(invoice_json).to eq({
      'id'                 => @transaction.id,
      'invoice_id'         => @transaction.invoice_id,
      'credit_card_number' => @transaction.credit_card_number,
      'result'             => @transaction.result
    })
  end

  it "can return a random invoice" do
    get "/api/v1/transactions/random"

    results = JSON.parse(body)
    expect(results.has_key?("id"))
    expect(results.has_key?("invoice_id"))
    expect(results.has_key?("credit_card_number"))
    expect(results.has_key?("result"))
  end
end
