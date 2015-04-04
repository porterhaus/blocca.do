class Api::ListsController < Api::ApiController
  before_action :authenticate_with_token!

  def index
    @lists = List.all
    render json: @lists, status: 200
  end

  def show
    @list = List.find(params[:id])
    if @list.viewable == true || @list.user_id == current_user.id
      render json: @list, status: 200
    else
      render json: { errors: "This list cannot be viewed." }, status: 403
    end
  end
  
  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      render json: @list, status: 201
    else
      render json: @list.errors, status: 422
    end
  end

  def update
    @list = List.find(params[:id])
    if @list.open == true || @list.user_id == current_user.id
      if @list.update(list_params)
        render json: @list, status: 200
      else
        render json: { errors: @list.errors }, status: 422
      end
    else
      render json: { errors: "This list cannot be modified."}, status: 403
    end
  end

  def destroy
    @list = current_user.lists.find(params[:id])
    @list.destroy
    head 204
  end

  private

    def list_params
      params.require(:list).permit(:title, :viewable, :open)
    end
end
