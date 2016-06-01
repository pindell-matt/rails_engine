require 'rails_helper'

RSpec.describe 'GET /api/v1/merchants' do
  it "returns JSON of all Merchants" do
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
end
