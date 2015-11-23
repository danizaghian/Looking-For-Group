class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.integer :min_players
      t.integer :max_player
      t.text :description

      t.timestamps null: false
    end
  end
end
