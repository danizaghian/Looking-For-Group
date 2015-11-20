class AddSlugToGenre < ActiveRecord::Migration
  def change
    add_column :genres, :slug, :string
    add_index :genres, :slug, unique: true
  end
end
