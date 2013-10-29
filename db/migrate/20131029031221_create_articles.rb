class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string   :title
      t.text     :body
      t.integer  :customer_id
      t.float    :rating
      t.boolean  :published

      t.timestamps
    end
  end
end
