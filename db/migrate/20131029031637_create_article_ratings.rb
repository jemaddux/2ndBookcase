class CreateArticleRatings < ActiveRecord::Migration
  def change
    create_table :article_ratings do |t|
      t.integer  :article_id
      t.integer  :customer_id
      t.integer  :rating
      t.boolean  :active

      t.timestamps
    end
  end
end
