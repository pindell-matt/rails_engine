class Api::V1::Merchants::RevenueController < Api::ApiController
  respond_to :json

  def index
    respond_with Merchant.most_revenue(params['quantity'])
  end

  def show
    respond_with Merchant.revenue(params['date'])
  end
end
