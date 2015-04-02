class Api::TasksController < Api::ApplicationController
  before_action :authenticate_with_token!
  

end
