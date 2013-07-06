class AddInListToReadingLists < ActiveRecord::Migration
  def change
    add_column :reading_lists, :in_list, :boolean, default: true
  end
end
