class AddPictureUrlToBook < ActiveRecord::Migration
  def change
    add_column :books, :picture_url, :text, :limit => nil
  end
end
