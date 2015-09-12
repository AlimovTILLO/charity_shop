class BalanceFieldsAdded < ActiveRecord::Migration
  def change
    add_column :users, :balance, :integer, default: 0
    add_column :foundations, :balance, :integer, default: 0
  end
end
