class Api::ApiController < ApplicationController
  protect_from_forgery with: :null_session
  helper_method :strong_params

  def strong_params
    params.require("id")
  end
end
