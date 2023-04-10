class RemoveColumnUserIdFromSupportChat < ActiveRecord::Migration[7.0]
  def change
    remove_column :support_chats, :user_id, :string
  end
end
