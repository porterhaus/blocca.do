class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
  end

  def regenerate
    @user = current_user
    if @user.regenerate_token
      flash[:notice] = "Auth token updated. Don't forget to update your code!"
      redirect_to auth_path
    else
      flash[:alert] = "Error updating your auth_token. Please try to regenerate again!"
      redirect_to auth_path
    end
  end

  def reactivate
    @user = current_user
    if @user.reactivate_flag
      flash[:notice] = "Your Auth token has been reactivated successfully!"
      redirect_to auth_path
    else
      flash[:alert] = "Error reactivating your auth_token. Please try to reactivate again!"
      redirect_to auth_path
    end
  end

  def deactivate
    @user = current_user
    if @user.deactivate_flag
      flash[:alert] = "Your Auth token has been deactivated. You must reactivate before using!"
      redirect_to auth_path
    else
      flash[:alert] = "Error deactivating your auth_token. Please try to deactivate again!"
      redirect_to auth_path
    end
  end

  private

   def user_params
     params.require(:user).permit(:name, :email, :password, :auth_token, :auth_token_flag)
   end

end
