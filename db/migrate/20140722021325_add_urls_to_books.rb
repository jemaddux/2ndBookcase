class AddUrlsToBooks < ActiveRecord::Migration
  def change
    add_column :books, :mobi_url, :string
    add_column :books, :pdf_url, :string
    add_column :books, :epub_url, :string
    add_column :books, :txt_url, :string
  end
end
