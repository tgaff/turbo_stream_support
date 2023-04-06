# == Schema Information
#
# Table name: messages
#
#  id              :integer          not null, primary key
#  text            :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  support_chat_id :integer          not null
#  user_id         :string           not null
#
# Indexes
#
#  index_messages_on_support_chat_id  (support_chat_id)
#
# Foreign Keys
#
#  support_chat_id  (support_chat_id => support_chats.id)
#
class Message < ApplicationRecord
  belongs_to :support_chat

  def is_mine?(state_obj)
    session = state_obj.respond_to?(:session) ? state_obj.session : state_obj
    user_id == session[:session_id]
  end
end
