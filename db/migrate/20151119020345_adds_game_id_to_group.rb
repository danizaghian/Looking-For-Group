class AddsGameIdToGroup < ActiveRecord::Migration
  def change
  	add_column :groups, :game_id, :integer
  end
end
