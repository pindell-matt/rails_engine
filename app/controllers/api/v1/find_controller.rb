class Api::V1::FindController < Api::ApiController
  respond_to :json

  def index
    respond_with model_param.where(finder_params)
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
        :created_at,
        :updated_at
      )
    end
end
