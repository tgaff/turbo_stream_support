class MessagesController < ApplicationController
  before_action :set_support_chat

  def create
    @message = @support_chat.messages.create(message_params)
    respond_to do |format|
      # format.turbo_stream { render 'create' }  # TODO: finish later
      format.html { redirect_to @support_chat }
    end
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
