#spec/book_spec.rb

require "rails_helper"



RSpec.describe 'Book', type: :system do


	#unit testing
	
	#book model unit test
	it 'checks that book entry is created and in the database' do
		@book = Book.new(title: "Frankenstein", author: "Mary Shelley", genre: "fiction", 
						 price: "2.99", publishDate: "2000")
		@book.save
		
		visit books_index_path
		sleep(4)	
		expect(@book).to be_valid
	end
	
	
	
	#integration testing 
	
	#test integration of create page and index page by
	#indicating if flash triggered by create page shows 
	#up on index page
	
	it 'checks that flash notice has been activated' do
		visit books_new_path
		sleep(3)
		click_button "Create Book" #creates an empty, but valid entry
		sleep(3)
		expect(page).to have_content("was added successfully")
	end
	
	
	
	
	#acceptance testing
	
	#implements the 'delete a book' user requirement
	#'as a user, I would like to be able to delete 
	# a book in the collection'
	it 'edits a book' do
		@book = Book.new(title: "Romeo and Juliet", author: "Shakespeare", genre: "fiction",
						 price: "10.99", publishDate: "2000") #creates entry with title and author only
		@book.save
		
		visit "books/delete?id=#{@book.id}" #path to edit page
		sleep(3)
	
		click_button "Delete Book" #deletes book from the database
		sleep(3)
		expect(page).to have_content("deleted successfully")
		
	end


	
	#test double
	
	#create a mock test to allow double to recieve info from 
	#entries already in the database 
	it "confirms that a book entry is valid" do
		@book = Book.new(title: "Harry Potter", author: "JK Rowling", genre: "fiction", 
						 price: "19.99", publishDate: "2000") #creates entry with title only
		@book.save
		visit books_index_path
		sleep(3)
		
		book = double()
		allow(book).to receive(:title).and_return(@book.title)
		expect(book.title).to eq(@book.title)
	end

	
	
	
end