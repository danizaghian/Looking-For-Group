class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :city
      t.datetime :meet_date
      t.integer :gm

      t.timestamps null: false
    end
  end
end
