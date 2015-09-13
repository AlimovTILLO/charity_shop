class AddDefaultToCharity < ActiveRecord::Migration
  def change
    change_column :items, :charity, :integer, default: 50
  end
end
