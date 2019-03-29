class TodoItemsController < ApplicationController
  before_action :set_todo_list

  def create
    @todo_item = @todo_list.todo_items.create(todo_item_params)
    redirect_to @todo_list
  end

  def edit
    @todo_item = @todo_list.todo_items.find(params[:id])
  end

  def update
    @todo_item = @todo_list.todo_items.find(params[:id])
    if @todo_item.update(todo_item_params)
      redirect_to @todo_list, notice: 'Todo Item was successful updated.'
    else
      render 'edit'
    end
  end  

  def destroy
    @todo_item = @todo_list.todo_items.find(params[:id])
    if @todo_item.destroy
      flash[:success] = 'Todo Item was deleted.'
    else
      flash[:error] = 'Todo Item could not be deleted.'
    end
    redirect_to @todo_list
  end

private
  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def todo_item_params
    params.require(:todo_item).permit(:content)
  end
  
end
