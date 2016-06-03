class Api::V1::Items::MerchantsController < Api::ApiController
  respond_to :json

  def show
    respond_with Item.find(strong_params).merchant
  end
end
