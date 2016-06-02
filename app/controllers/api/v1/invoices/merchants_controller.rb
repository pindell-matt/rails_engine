class Api::V1::Invoices::MerchantsController < Api::ApiController
  respond_to :json

  def show
    respond_with Invoice.find(strong_params).merchant
  end
end
