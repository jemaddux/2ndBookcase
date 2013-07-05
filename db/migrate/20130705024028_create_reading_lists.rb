class CreateReadingLists < ActiveRecord::Migration
  def change
    create_table  :reading_lists do |t|
      t.integer   :customer_id
      t.integer   :inventory_id
      t.integer   :book_id
      t.string    :loan_out_condition
      t.string    :returned_condition
      t.datetime  :loan_out_date
      t.datetime  :returned_date
      t.boolean   :out_on_loan

      t.timestamps
    end
  end
end
