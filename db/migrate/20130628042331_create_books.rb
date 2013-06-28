class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :description
      t.float :rating
      t.integer :times_rated

      t.timestamps
    end
  end
end
