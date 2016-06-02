class Api::V1::Merchants::ItemsController < Api::ApiController
  respond_to :json

  def index
    respond_with Merchant.find(merchant_params).items.reverse
  end

  private
    def merchant_params
      params.require("id")
    end
end
