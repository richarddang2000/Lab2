#spec/book_spec.rb

require "rails_helper"



RSpec.describe 'Book', type: :system do


	before(:all) do
		@book = Book.new(title: "Frankenstein", author: "Mary Shelley")
		@book.save
	end


	#unit testing
	it 'checks that book is createable' do
		visit "books/index"
		sleep(5)	
		expect(@book).to be_valid
	end
	
	it 'checks that bookis deleted' do
		@book.destroy
		expect(Book.find_by(title: "Frankensein")).to be_nil
	end
	
	#integration testing 
	it 'checks that flash notice has been activated' do
		visit books_new_path
		select "nonfiction", :from
		sleep(5)
		click_button "Create Book"
		sleep(5)
		expect(page).to have_content("was added successfully")
	end
	
	
	
end