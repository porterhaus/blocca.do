class Api::SessionsController < Api::ApiController 
  def create
    @user_password = params[:session][:password]
    @user_email = params[:session][:email]
    @user = User.find_by_email(@user_email)
    if @user.nil?
      render json: { errors: "User email not found." }, status: 422
    else
      if @user.valid_password? @user_password
        sign_in @user, store: false
        render json: @user, status: 200, location: [:api, @user]
      else
        render json: { errors: "Invalid email or password" }, status: 422
      end
    end
  end

  def destroy
    @user = User.find_by(auth_token: params[:id])
    if @user.nil?
      render json: { errors: "User session already destroyed." }, status: 422
    else
      sign_out @user
      render json: { message: "User session destroyed."}, status:200
    end
  end 
end
