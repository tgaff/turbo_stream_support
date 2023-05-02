class AddChatGuidToSupportChat < ActiveRecord::Migration[7.0]
  def up
    add_column :support_chats, :chatter_uuid, :string, index: true, unique: true
    SupportChat.all.each do |needs_uuid|
      needs_uuid.update!(chatter_uuid: SecureRandom.uuid)
    end

    change_column_null :support_chats, :chatter_uuid, false
  end

  def down
    remove_column :support_chats, :chatter_uuid
  end
end
