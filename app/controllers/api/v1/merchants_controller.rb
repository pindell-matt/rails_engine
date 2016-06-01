class Api::V1::MerchantsController < Api::ApiController
  respond_to :json, :xml

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find(params[:id])
  end

  def find
    respond_with Merchant.find_by(finder)
  end

  def find_all
    respond_with Merchant.where(finder)
  end

  def random
    respond_with Merchant.order("RANDOM()").first
  end

  private
    def finder
      params.symbolize_keys.extract!(
        :id,
        :name,
        :created_at,
        :updated_at
      )
    end
end
