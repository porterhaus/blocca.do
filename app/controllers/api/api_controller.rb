class Api::ApiController < ApplicationController

  include Authenticable
  
  respond_to :json

  # For APIs, you may want to use :null_session
  # without this setting Devise has a bug that will throw
  # an INVALID_AUTHENTICITY_TOKEN_ERROR
  protect_from_forgery with: :null_session

end
