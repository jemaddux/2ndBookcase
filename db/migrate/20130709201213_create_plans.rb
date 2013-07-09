class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string   :description
      t.decimal  :cost, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
