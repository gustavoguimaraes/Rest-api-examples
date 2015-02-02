class Api::V1::TodosController < ApplicationController
  protect_from_forgery with: :null_session
  respond_to :json

  def index
    respond_with Todo.all
  end

  def show
    respond_with Todo.find(params[:id])
  end

  def create
    todo = Todo.create(todo_params)
    if todo.errors.empty?
      respond_with todo, location: api_v1_todo_url(todo)
    else
      render json: {errors: todo.errors}, status: 400
    end
  end

  def update
    todo = Todo.find(params[:id])
    if todo.update(todo_params)
      respond_with todo, location: api_v1_todo_url(todo)
    else
      render json: {errors: todo.errors}, status: 400
    end
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    head :ok, status: 204
  end

  def todo_params
    params.require(:todo).permit(:content, :completed)
  end

end
