class Api::V1::InvoiceItems::ItemsController < Api::ApiController
  respond_to :json

  def show
    respond_with InvoiceItem.find(strong_params).item
  end
end
