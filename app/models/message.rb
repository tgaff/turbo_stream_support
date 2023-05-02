# == Schema Information
#
# Table name: messages
#
#  id              :integer          not null, primary key
#  chatter_uuid    :string           not null
#  text            :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  support_chat_id :integer          not null
#
# Indexes
#
#  index_messages_on_chatter_uuid     (chatter_uuid)
#  index_messages_on_support_chat_id  (support_chat_id)
#
# Foreign Keys
#
#  support_chat_id  (support_chat_id => support_chats.id)
#
class Message < ApplicationRecord
  belongs_to :support_chat

  validates :text, :chatter_uuid, presence: true
end
