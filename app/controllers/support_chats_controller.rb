class SupportChatsController < ApplicationController
  def new
    chat = SupportChat.find_by(user_id: session_id)

    if chat.present?
      redirect_to chat
      return
    end

    @chat = SupportChat.new
    render 'new'
  end

  def create
    @chat = SupportChat.find_or_initialize_by user_id: session_id
    @chat.assign_attributes(chat_params)
    @chat.save!
    redirect_to @chat
  end

  def show
    @chat = SupportChat.find(params[:id])
  end

  def index
    @support_chats = SupportChat.all.order(:updated_at)
  end

  private

  def chat_params
    params.require(:support_chat).permit(:user_name)
  end

  def session_id
    session[:session_id]
  end
end
