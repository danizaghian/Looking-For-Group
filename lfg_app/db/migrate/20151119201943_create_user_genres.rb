class CreateUserGenres < ActiveRecord::Migration
  def change
    create_table :user_genres do |t|

      t.timestamps null: false
    end
  end
end
