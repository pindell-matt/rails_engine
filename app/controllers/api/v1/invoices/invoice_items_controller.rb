class Api::V1::Invoices::InvoiceItemsController < Api::ApiController
  respond_to :json

  def index
    respond_with Invoices.find(strong_params).invoice_items
  end
end
