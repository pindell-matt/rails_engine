class Api::V1::Customers::TransactionsController < Api::ApiController
  respond_to :json

  def index
    respond_with Customer.find(strong_params).transactions
  end
end
