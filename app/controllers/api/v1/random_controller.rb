class Api::V1::RandomController < Api::ApiController
  respond_to :json
  
  def show
    respond_with model_params.order("RANDOM()").first
  end

  private
    def model_params
      params["model"].classify.constantize
    end

end
