class CreateSupportChats < ActiveRecord::Migration[7.0]
  def change
    create_table :support_chats do |t|
      t.string :user_id
      t.string :user_name

      t.timestamps
    end
  end
end
