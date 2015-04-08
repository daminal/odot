require 'spec_helper'

describe 'Creating todo lists' do 
	it 'redirects to the todo list index page on success' do
		visit todo_lists_path
>>>>>>> 659f75ba34df93ff05df29a7f6f5d562cf455762
		click_link 'New Todo list'
		expect(page).to have_content('New todo_list')

	end
end


