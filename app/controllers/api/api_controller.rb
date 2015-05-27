class Api::ApiController < ApplicationController

  include Authenticable

  respond_to :json

  # For APIs, you may want to use :null_session
  # without this setting Devise has a bug that will throw
  # an INVALID_AUTHENTICITY_TOKEN_ERROR
  protect_from_forgery with: :null_session

  # Overide strong_parameters UnpermittedParameters method to display a json response
  rescue_from(ActionController::UnpermittedParameters) do |unpermitted_parameter_exception|
    error = {}
    error[unpermitted_parameter_exception] = ['Parameter is not allowed.']
    response = { errors: [error] }
    respond_to do |format|
      format.json { render json: response, status: :unprocessable_entity }
    end
  end

end
