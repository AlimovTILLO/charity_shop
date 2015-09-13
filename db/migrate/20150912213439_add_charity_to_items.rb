class AddCharityToItems < ActiveRecord::Migration
  def change
    add_column :items, :charity, :integer
  end
end
