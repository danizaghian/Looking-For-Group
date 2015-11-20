class AddGameNameToGroup < ActiveRecord::Migration
  def change
  	    add_column :groups, :game_name, :string

  end
end
