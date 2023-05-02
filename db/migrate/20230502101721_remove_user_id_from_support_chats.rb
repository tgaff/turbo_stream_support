class RemoveUserIdFromSupportChats < ActiveRecord::Migration[7.0]
  def change
    remove_column :support_chats, :user_id, :integer, null: true
  end
end
