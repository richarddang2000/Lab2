class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :genre
      t.decimal :price
      t.string :publishDate
	  t.timestamp :published_date

      t.timestamps
    end
  end
end
