class FoundationIdForItems < ActiveRecord::Migration
  def change
    add_column :items, :foundation_id, :integer
  end
end
