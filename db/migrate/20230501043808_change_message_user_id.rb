class ChangeMessageUserId < ActiveRecord::Migration[7.0]
  def change
    remove_column :messages, :user_id, :integer, index: true
    Message.find_each { |m| m.destroy }
    add_column :messages, :chatter_uuid, :string, null: false, index: true
  end
end
