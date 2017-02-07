class TodosController < ApplicationController
  def index
    todos = Todo.where(username: params[:username])
    render json: { todos: todos }
  end

  def create
    todo = Todo.new todo_params.merge(username: params[:username])
    if todo.save
      render json: { todo: todo }
    else
      render status: 422, json: { errors: todo.errors.full_messages }
    end
  end

  def update
    todo = Todo.find_by(id: params[:id], username: params[:username])
    if todo.present? && params.has_key?(:todo)
      todo.update completed: params[:todo][:completed]
      render json: { todo: todo }
    else
      render status: 404, json: { errors: ['Not found'] }
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:name)
  end
end
