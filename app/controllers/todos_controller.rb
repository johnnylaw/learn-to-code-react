class TodosController < ApplicationController
  def index
    todos = Todo.where(username: params[:user_id])
    render json: { todos: todos }
  end

  def create
    todo = Todo.new todo_params.merge(username: params[:user_id])
    if todo.save
      render json: { todo: todo }
    else
      render status: 422, json: { errors: todo.errors.full_messages }
    end
  end

  def update
    todo = Todo.find_by(id: params[:id], username: params[:user_id])
    if todo.present?
      if todo.update todo_params
        render json: { todo: todo }
      else
        render status: 422, json: { errors: todo.errors.full_messages }
      end
    else
      render status: 404, json: { errors: ['Not found'] }
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:name)
  end
end
