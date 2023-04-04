class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :support_chat, null: false, foreign_key: true
      t.string :text, null: false
      t.string :user_id, null: false

      t.timestamps
    end
  end
end
