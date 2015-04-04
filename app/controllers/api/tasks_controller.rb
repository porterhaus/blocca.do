class Api::TasksController < Api::ApiController
  before_action :authenticate_with_token!

  def show
    @task = Task.find(params[:id])
    render json: @task, status: 200
  end

  def create
    @task = Task.new(task_params)
    @task.list_id = params[:list_id]
    if @task.save
      render json: @task, status: 201
    else
      render json: @task.errors, status: 422
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      render json: @task, status: 200
    else
      render json: @task.errors, status: 422
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    head 204
  end

  private

    def task_params
      params.require(:task).permit(:description, :list_id)
    end
end
