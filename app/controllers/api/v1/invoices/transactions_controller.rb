class Api::V1::Invoices::TransactionsController < Api::ApiController
  respond_to :json

  def index
    respond_with Invoice.find(strong_params).transactions
  end
end
