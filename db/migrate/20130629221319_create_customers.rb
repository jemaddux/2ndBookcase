class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :account_status
      t.string :rental_plan

      t.timestamps
    end
  end
end
