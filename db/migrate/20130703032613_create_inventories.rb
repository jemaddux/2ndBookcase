class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.integer :book_id
      t.string :condition

      t.timestamps
    end
  end
end
