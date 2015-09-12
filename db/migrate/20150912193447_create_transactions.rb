class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :purchase_id

      # User transactions
      t.integer :from_user_id
      t.integer :from_user_sum
      t.integer :to_user_id
      t.integer :to_user_sum

      # Foundation transactions
      t.integer :from_foundation_id
      t.integer :from_foundation_sum
      t.integer :to_foundation_id
      t.integer :to_foundation_sum

      t.timestamps null: false
    end
  end
end
