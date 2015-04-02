class CreateTodoLists < ActiveRecord::Migration
  def change
    create_table :todo_lists do |t|
      t.string :title
      t.string :string
      t.text :description

      t.timestamps
    end
  end
end
