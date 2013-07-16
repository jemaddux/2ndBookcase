class AddInCirculationToInventory < ActiveRecord::Migration
  def change
    add_column :inventories, :in_circulation, :boolean, default: true
  end
end
