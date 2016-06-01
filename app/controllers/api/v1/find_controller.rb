class Api::V1::FindController < Api::ApiController
  respond_to :json

  def index
    respond_with model_params.where(finder_params)
  end

  def show
    respond_with model_params.find_by(finder_params)
  end

  private
    def model_params
      params["model"].classify.constantize
    end

    def finder_params
      params.symbolize_keys.extract!(
        :id,
        :name,
        :created_at,
        :updated_at
      )
    end
end
