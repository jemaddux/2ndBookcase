class AddPlanToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :plan_id, :integer
  end
end
