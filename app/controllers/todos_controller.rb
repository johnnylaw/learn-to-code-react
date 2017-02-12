class TodosController < ApplicationController
  before_action :set_todo, only: [:update, :destroy]

  def index
    todos = Todo.where(username: params[:username])
    render json: { todos: todos }
  end

  def create
    todo = Todo.new(todo_params.merge(username: params[:username]))
    if todo.save
      render json: { todo: todo }
    else
      render json: { errors: @todo.errors.full_messages },
             status: 422
    end
  end

  def update
    if @todo.update(todo_params)
      render json: { todo: @todo }
    else
      render json: { errors: @todo.errors.full_messages },
             status: 422
    end
  end

  def destroy
    @todo.destroy
    render json: {}
  end

  private

  def todo_params
    params.require(:todo).permit(:name, :completed)
  end

  def set_todo
    todo = Todo.find_by(id: params[:id], username: params[:username])
    if todo
      @todo = todo
    else
      render json: { errors: ['Not found'] },
             status: 404
    end
  end
end
