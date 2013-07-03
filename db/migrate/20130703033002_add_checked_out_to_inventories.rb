class AddCheckedOutToInventories < ActiveRecord::Migration
  def change
    add_column :inventories, :checked_out, :boolean, default: false
  end
end
