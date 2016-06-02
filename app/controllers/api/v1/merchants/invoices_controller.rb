class Api::V1::Merchants::InvoicesController < Api::ApiController
  respond_to :json

  def index
    respond_with Merchant.find(merchant_params).invoices.reverse
  end

  private
    def merchant_params
      params.require("id")
    end
end
