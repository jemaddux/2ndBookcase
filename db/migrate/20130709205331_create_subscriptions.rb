class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer  :plan_id
      t.integer  :customer_id
      t.string   :stripe_card_token

      t.timestamps
    end
  end
end
