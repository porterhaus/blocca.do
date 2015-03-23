class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
  end

  def dashboard
  end

  def profile
  end

  def update
  end

  def regenerate
    @user = current_user
    @user.auth_token = reset_token
    if @user.save
      flash[:notice] = "Auth token updated. Don't forget to update your code!"
      redirect_to users_path
    else
      flash[:error] = "Error updating your auth_token. Please try again!"
      redirect_to users_path
    end
  end

  private
 
   def user_params
     params.require(:user).permit(:name, :email, :password, :auth_token)
   end

   def reset_token
    Devise.friendly_token
   end

end
