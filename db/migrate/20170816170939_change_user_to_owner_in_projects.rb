class ChangeUserToOwnerInProjects < ActiveRecord::Migration[5.1]
  def change
      rename_column :projects, :user_id, :owner_id
  end
end
