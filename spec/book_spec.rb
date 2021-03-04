#spec/book_spec.rb

require "rails_helper"



RSpec.describe 'Book', type: :system do


	#unit testing
	it 'checks that book is createable' do
		@book = Book.new(title: "Frankenstein", author: "Mary Shelley")
		@book.save
		
		visit "books/index"
		sleep(3)	
		expect(@book).to be_valid
	end
	
	#integration testing 
	it 'checks that flash notice has been activated' do
		visit books_new_path
		sleep(3)
		click_button "Create Book"
		sleep(3)
		expect(page).to have_content("was added successfully")
	end
	
	#acceptance testing
	it 'edits a book' do
		@book = Book.new(title: "Romeo and Juliet", author: "Shakespeare")
		@book.save
		
		visit "books/#{@book.id}/edit"
		sleep(3)
	
		click_button "Update Book"
		expect(page).to have_content("Romeo and Juliet")
		sleep(2)
	end

=begin	
	#test double
	it "allows response w a block" do
		entry = double()
		allow(dbl).to receive(:hey!) {"Ho!"}
		expect(dbl.hey!).to eq("Ho!")
	end
=end
		
	
	
	#it 'checks that books deleted' do
	#	@book.destroy
	#	expect(Book.find_by(title: "Frankensein")).to be_nil
	#end
		
	
	
	
end