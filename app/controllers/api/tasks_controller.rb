class Api::TasksController < Api::ApiController
  before_action :authenticate_with_token!

  def show
    @task = Task.find(params[:id])
    if @task.viewable? || @task.list.user_id == current_user.id
      render json: @task, status: 200
    else
      render json: { errors: "This task cannot be viewed." }, status: 403
    end
  end

  def create
    @list = List.find(params[:list_id])
    if @list.open == true || @list.user_id == current_user.id
      @task = Task.new(task_params)
      @task.list_id = params[:list_id]
      if @task.save
        render json: @task, status: 201
      else
        render json: @task.errors, status: 422
      end
    else
     render json: { errors: "This action cannot be accessed." }, status: 403
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.open? || @task.list.user_id == current_user.id
      if @task.update(task_params)
        render json: @task, status: 200
      else
        render json: @task.errors, status: 422
      end
    else
      render json: { errors: "This action cannot be accessed." }, status: 403
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.open? || @task.list.user_id == current_user.id
      @task.destroy
      head 204
    else
      render json: { errors: "This action cannot be accessed." }, status: 403
    end
  end

  private

    def task_params
      params.require(:task).permit(:description, :list_id)
    end

end
