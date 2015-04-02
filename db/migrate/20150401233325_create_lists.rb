class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title
      t.boolean :viewable
      t.boolean :open
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :lists, :usersrakew 
  end
end
