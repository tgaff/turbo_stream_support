class MessagesController < ApplicationController
  before_action :set_support_chat

  def create
    @message = @support_chat.messages.create(message_params)
    respond_to do |format|
      format.turbo_stream
      # format.html { redirect_to @support_chat }
    end
  end

  private

  def message_params
    params.require('message').permit('text')
  end

  def set_support_chat
    @support_chat = SupportChat.find(params[:support_chat_id])
  end
end
