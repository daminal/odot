require 'spec_helper'

describe 'Creating todo lists' do 
	def create_todo_list(options={})
		options[:title] ||= 'My todo list'
		options[:description] ||= 'This is my todo list.'

		visit todo_lists_path
		click_link 'New Todo list'
		expect(page).to have_content('New todo_list')

		fill_in 'Title', with: options[:title]
		fill_in 'Description', with: options[:description]
		click_button 'Create Todo list'
	end

	it 'redirects to the todo list index page on success' do
		create_todo_list
		expect(page).to have_content('My todo list')
	end

	it 'displays an error when the todo list has no title' do
		expect(TodoList.count).to eq(0)

		create_todo_list title: ''

		expect(page).to have_content('error')
		expect(TodoList.count).to eq(0)		

		visit todo_lists_path
		expect(page).to_not have_content('This is what I\'m doing today.')
	end

	it 'displays an error when the todo list has a title less than 3 characters' do
		expect(TodoList.count).to eq(0)

		create_todo_list title: 'Hi'

		expect(page).to have_content('error')
		expect(TodoList.count).to eq(0)		

		visit todo_lists_path
		expect(page).to_not have_content('This is what I\'m doing today.')
	end
	
	it 'displays an error when the todo list has no description' do
		expect(TodoList.count).to eq(0)

		create_todo_list title: 'Grocery list', description: ''

		expect(page).to have_content('error')
		expect(TodoList.count).to eq(0)	

		visit todo_lists_path
		expect(page).to_not have_content('Grocery list')
	end

it 'displays an error when the todo list has no description' do
		expect(TodoList.count).to eq(0)

		create_todo_list title: 'Grocery list', description: 'Food'

		expect(page).to have_content('error')
		expect(TodoList.count).to eq(0)		

		visit todo_lists_path
		expect(page).to_not have_content('Grocery list')
		#Oh, I get it! We are making sure that an error pops up when we don't get a user entry we want.
		#The "displays" is used to determine where the user sees "error". 
		#The "expect" statement determines where the console displays an error to developer.
		#What we're doing is making sure we get valid input from user on every blank
		#We do this by having a file pose as a user. Why not just try it ourselves?
	end

end


