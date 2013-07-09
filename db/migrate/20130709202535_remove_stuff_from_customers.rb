class RemoveStuffFromCustomers < ActiveRecord::Migration
  def change
    remove_column :customers, :rental_plan
    remove_column :customers, :crypted_password
    remove_column :customers, :salt
    remove_column :customers, :remember_me_token
    remove_column :customers, :remember_me_token_expires_at
  end
end
