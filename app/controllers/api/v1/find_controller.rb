class Api::V1::FindController < Api::ApiController
  respond_to :json

  def index
    # refactor
    if finder_params.has_key?(:unit_price)
      respond_with model_param.where({
        unit_price: (finder_params[:unit_price].to_f * 100).to_i
      })
    else
      respond_with model_param.where(finder_params)
    end
    
  end

  def show
    respond_with model_param.find_by(finder_params)
  end

  private
    def model_param
      params.permit("model")["model"].classify.constantize
    end

    def finder_params
      params.symbolize_keys.extract!(
        :id,
        :name,
        :first_name,
        :last_name,
        :merchant_id,
        :customer_id,
        :invoice_id,
        :item_id,
        :unit_price,
        :quantity,
        :description,
        :credit_card_number,
        :status,
        :result,
        :created_at,
        :updated_at
      )
    end
end
