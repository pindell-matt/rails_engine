class Api::V1::Merchants::RevenueController < Api::ApiController
  respond_to :json

  def index
    respond_with Merchant.most_revenue(params['quantity'])
  end

  def show
    if !(params['id'] && params['date']).nil?
      respond_with Merchant.single_merchant_revenue_with_date(params['id'], params['date'])
    elsif params['date']
      respond_with Merchant.revenue_by_date(params['date'])
    else
      # require "pry"
      # binding.pry
      respond_with Merchant.single_merchant_revenue(params['id'])
    end
  end

end
