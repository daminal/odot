require 'spec_helper'

describe TodoItemsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      todo_list = TodoList.create(title: 'Todo List', description: 'This is a todo list')
      get 'index', todo_list_id: todo_list.id
      #The above line is from Brendon, not treehouse. 
    end
  end

end
