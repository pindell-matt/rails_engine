class Api::V1::MerchantsController < Api::ApiController
  respond_to :json

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find(params[:id])
  end

  # kick out to separate controller (dedicated find controller?)
  # def find
  #   respond_with Merchant.find_by(finder_params)
  # end

  def find_all
    respond_with Merchant.where(finder_params)
  end

  def random
    respond_with Merchant.order("RANDOM()").first
  end

  private
    def finder_params
      params.symbolize_keys.extract!(
        :id,
        :name,
        :created_at,
        :updated_at
      )
    end
end
