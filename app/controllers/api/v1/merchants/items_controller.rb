class Api::V1::Merchants::ItemsController < Api::ApiController
  respond_to :json

  def index
    respond_with Merchant.find(strong_params).items.reverse
  end
end
