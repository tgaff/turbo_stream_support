# == Schema Information
#
# Table name: messages
#
#  id              :integer          not null, primary key
#  text            :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  support_chat_id :integer          not null
#  user_id         :integer
#
# Indexes
#
#  index_messages_on_support_chat_id  (support_chat_id)
#  index_messages_on_user_id          (user_id)
#
# Foreign Keys
#
#  support_chat_id  (support_chat_id => support_chats.id)
#
class Message < ApplicationRecord
  belongs_to :support_chat

  validates :user, presence: true
  validates :text, presence: true
end
