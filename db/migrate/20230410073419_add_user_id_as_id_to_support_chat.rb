class AddUserIdAsIdToSupportChat < ActiveRecord::Migration[7.0]
  def change
    add_reference :support_chats, :user
  end
end
