class CreateSupportChats < ActiveRecord::Migration[7.0]
  def change
    create_table :support_chats do |t|
      t.string :customer_name, null: false

      t.timestamps
    end
  end
end
