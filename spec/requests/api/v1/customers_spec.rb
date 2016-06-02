require 'rails_helper'

RSpec.describe "Customer Record Endpoint" do

  before(:each) do
    @customers = create_list(:customer, 3)
    @customer  = @customers.first
  end

  it "returns all customers with /customers" do
    get '/api/v1/customers'

    results = JSON.parse(body)
    expect(results.count).to eq(3)
    customer_json = results.first
    expect(customer_json).to eq({
      'id'         => @customer.id,
      'first_name' => @customer.first_name,
      'last_name'  => @customer.last_name
    })
  end

  it "returns individual customer with /customers/:id" do
    get "/api/v1/customers/#{@customer.id}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'         => @customer.id,
      'first_name' => @customer.first_name,
      'last_name'  => @customer.last_name
    })
  end

  it "can find a customer based on id" do
    get "/api/v1/customers/find?id=#{@customer.id}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'         => @customer.id,
      'first_name' => @customer.first_name,
      'last_name'  => @customer.last_name
    })
  end

  it "can find a customer based on first_name" do
    get "/api/v1/customers/find?first_name=#{@customer.first_name}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'         => @customer.id,
      'first_name' => @customer.first_name,
      'last_name'  => @customer.last_name
    })
  end

  it "can find a customer based on last_name" do
    get "/api/v1/customers/find?last_name=#{@customer.last_name}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'         => @customer.id,
      'first_name' => @customer.first_name,
      'last_name'  => @customer.last_name
    })
  end

  it "can find a customer based on created_at" do
    get "/api/v1/customers/find?created_at=#{@customer.created_at}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'         => @customer.id,
      'first_name' => @customer.first_name,
      'last_name'  => @customer.last_name
    })
  end

  it "can find a customer based on updated_at" do
    get "/api/v1/customers/find?updated_at=#{@customer.updated_at}"

    results = JSON.parse(body)
    expect(results).to eq({
      'id'         => @customer.id,
      'first_name' => @customer.first_name,
      'last_name'  => @customer.last_name
    })
  end

  it "can find all based on first_name" do
    get "/api/v1/customers/find_all?first_name=#{@customer.first_name}"

    results = JSON.parse(body)
    expect(results.count).to eq(1)
    customer_json = results.first
    expect(customer_json).to eq({
      'id'         => @customer.id,
      'first_name' => @customer.first_name,
      'last_name'  => @customer.last_name
    })
  end

  it "can find all based on last_name" do
    get "/api/v1/customers/find_all?last_name=#{@customer.last_name}"

    results = JSON.parse(body)
    expect(results.count).to eq(1)
    customer_json = results.first
    expect(customer_json).to eq({
      'id'         => @customer.id,
      'first_name' => @customer.first_name,
      'last_name'  => @customer.last_name
    })
  end

  it "can find all based on created_at" do
    get "/api/v1/customers/find_all?created_at=#{@customer.created_at}"

    results = JSON.parse(body)
    expect(results.count).to eq(3)
    customer_json = results.first
    expect(customer_json).to eq({
      'id'         => @customer.id,
      'first_name' => @customer.first_name,
      'last_name'  => @customer.last_name
    })
  end

  it "can find all based on updated_at" do
    get "/api/v1/customers/find_all?updated_at=#{@customer.updated_at}"

    results = JSON.parse(body)
    expect(results.count).to eq(3)
    customer_json = results.first
    expect(customer_json).to eq({
      'id'         => @customer.id,
      'first_name' => @customer.first_name,
      'last_name'  => @customer.last_name
    })
  end

  it "can return a random customer" do
    get "/api/v1/customers/random"

    results = JSON.parse(body)
    expect(results.has_key?("id"))
    expect(results.has_key?("first_name"))
    expect(results.has_key?("last_name"))
  end
end
