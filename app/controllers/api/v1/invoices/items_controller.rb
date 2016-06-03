class Api::V1::Invoices::ItemsController < Api::ApiController
  respond_to :json

  def index
    respond_with Invoice.find(strong_params).items
  end
end
