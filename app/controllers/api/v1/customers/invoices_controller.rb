class Api::V1::Customers::InvoicesController < Api::ApiController
  respond_to :json

  def index
    respond_with Customer.find(strong_params).invoices
  end
end
