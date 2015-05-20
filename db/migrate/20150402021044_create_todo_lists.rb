class CreateTodoLists < ActiveRecord::Migration
  def change
    create_table :todo_lists do |t|
      t.string :title
      t.string :string
      t.text :description
      t.integer :cached_count, default: 0

      t.timestamps
    end
  end
end
