class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.string  :title
      t.text    :description
      t.integer :author_id

      t.timestamps
    end
  end
end
