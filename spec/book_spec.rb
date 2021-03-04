#spec/book_spec.rb

require "rails_helper"



RSpec.describe 'Book', type: :system do


	#unit testing
	#book model unit test
	it 'checks that book is createable and valid' do
		@book = Book.new(title: "Frankenstein", author: "Mary Shelley")
		@book.save
		
		visit "books/index"
		sleep(3)	
		expect(@book).to be_valid
	end
	
	
	#integration testing 
	#tess integration of create page and index page by
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
	#implements the 'edit a book' user requirement
	#'as a user, I would like to be able to edit 
	# a book in the collection'
	it 'edits a book' do
		@book = Book.new(title: "Romeo and Juliet", author: "Shakespeare") #creates entry with title and author only
		@book.save
		
		visit "books/#{@book.id}/edit" #path to edit page
		sleep(3)
	
		click_button "Update Book"
		expect(page).to have_content("Romeo and Juliet")
		sleep(3)
	end


	#test double
	#create a mock test to allow double to recieve info from 
	#entries already in the database
	it "confirms that a book entry is valid" do
		@book = Book.new(title: "Harry Potter") #creates entry with title only
		@book.save
		visit books_index_path
		sleep(3)
		
		book = double()
		allow(book).to receive(:title).and_return(@book.title)
		expect(book.title).to eq(@book.title)
	end

	
	
	
end