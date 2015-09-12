class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :seller_id
      t.integer :buyer_id
      t.integer :item_id
      t.integer :price
      t.datetime :confirmed_at

      t.timestamps null: false
    end
  end
end
