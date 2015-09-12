class CreateFoundations < ActiveRecord::Migration
  def change
    create_table :foundations do |t|
      t.belongs_to :user
      t.string :name
      t.string :description
      t.string :logo
      t.string :link
      t.string :legal_status

      t.timestamps null: false
    end
  end
end
