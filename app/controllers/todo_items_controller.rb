class TodoItemsController < ApplicationController
  def index
  	@todo_list = TodoList.find(params[:todo_list_id])
  end

  def new
   	@todo_list = TodoList.find(params[:todo_list_id])
 	@todo_item = @todo_list.todo_items.new
  end

  def create
  	@todo_list = TodoList.find(params[:todo_list_id])
 	@todo_item = @todo_list.todo_items.new(todo_item_params)
 	if @todo_item.save
 		flash[:success] = 'Added todo list item.'
 		redirect_to todo_list_todo_items_path
 	else
 		flash[:error] = 'There was a problem adding that todo list item.'
 		render action: :new
 	end
  end

  private
  def todo_item_params
  	params[:todo_item].permit(:content)
  end


end

#Brendon caught that on line 25, I had this:   	params(:todo_item).permit(:content)
#I needed this:   	params[:todo_item].permit(:content)
#I got this error message: wrong number of arguments (1 for 0)
#The technical problem was that when I use parentheses, it looks for an argument.
#It needed instead brackets *why, I don't know. 
#The procedural mistake I made was to view the presentation in less than full screen
#And the brackets looked too much like parentheses. 
#I must always use full screen mode to view the presentation. 