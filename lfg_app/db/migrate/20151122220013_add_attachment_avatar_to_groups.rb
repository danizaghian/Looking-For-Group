class AddAttachmentAvatarToGroups < ActiveRecord::Migration
def up
    add_attachment :groups, :avatar
  end

  def down
    remove_attachment :groups, :avatar
  end
end
