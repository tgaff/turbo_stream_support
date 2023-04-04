class SupportChatsController < ApplicationController

  def create
    chat_id = session[:session_id]

    @chat = SupportChat.find_or_create_by user_id: chat_id
    @chat.save!
    redirect_to @chat
  end

  def show
    @chat = SupportChat.find_by(params[:id])
  end
end
