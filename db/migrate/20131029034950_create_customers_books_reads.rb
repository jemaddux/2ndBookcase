class CreateCustomersBooksReads < ActiveRecord::Migration
  def change
    create_table :customers_books_reads do |t|
      t.integer :customer_id
      t.integer :book_id

      t.timestamps
    end
  end
end
