class TodosController < ApplicationController
  before_action :set_todo, only: [:edit, :update, :destroy]
  respond_to :html, :js, except: [:index]

  def index
    @todos = Todo.all
  end

  def edit
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to todos_path
    else
      render :new
    end
  end

  def update
    @todo.update(todo_params)
    if @todo.save
      redirect_to todos_path
    else
      render :edit
    end
  end

  def destroy
    @todo.destroy
    redirect_to todos_path
  end

  private

  def set_todo
    @todo = Todo.find params[:id]
  end

  def todo_params
    params.require(:todo).permit!
  end
end
