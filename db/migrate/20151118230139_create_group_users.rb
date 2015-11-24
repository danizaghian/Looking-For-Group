class CreateGroupUsers < ActiveRecord::Migration
  def change
    create_table :group_users do |t|
      t.references :user, index: true, foreign_key: true, on_delete: :cascade
      t.references :group, index: true, foreign_key: true, on_delete: :cascade

      t.timestamps null: false
    end
  end
end
