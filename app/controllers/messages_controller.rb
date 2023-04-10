class MessagesController < ApplicationController
  before_action :set_support_chat

  def create
    @message = @support_chat.messages.create(message_params)
    respond_to do |format|
      format.turbo_stream
      # format.html { redirect_to @support_chat }
      # format.html { head :no_content }
    end

    # and enqueue broadcast to everyone (note includes the sender too!)
    @message.broadcast_append_later_to(@support_chat, partial: 'support_chats/chat_messages_left',
      locals: {
        message: @message
      }
    )
  end

  def show
  end

  private

  def message_params
    params.require('message').permit('text').merge({ user_id: session_id })
  end

  def set_support_chat
    @support_chat = SupportChat.find(params[:support_chat_id])
  end

  def session_id
    session[:session_id]
  end
end
