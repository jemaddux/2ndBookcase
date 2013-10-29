class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.integer :book_id
      t.string :title
      t.text :summary
      t.integer :position

      t.timestamps
    end
  end
end
