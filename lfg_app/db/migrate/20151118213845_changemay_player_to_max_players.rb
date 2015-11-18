class ChangemayPlayerToMaxPlayers < ActiveRecord::Migration
  def change
  	remove_column :games, :max_player
  	add_column :games, :max_players, :integer
  end
end
