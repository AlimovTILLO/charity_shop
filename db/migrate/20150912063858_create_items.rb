class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.integer :price
      t.string :thumbnail

      t.timestamps null: false
    end
  end
end
