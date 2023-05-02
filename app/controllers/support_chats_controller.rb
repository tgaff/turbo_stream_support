class SupportChatsController < ApplicationController
  include SupportChatsHelper

  def new
    chat = SupportChat.find_by(chatter_uuid: chatter_uuid)

    if chat.present?
      redirect_to chat
      return
    end

    @chat = SupportChat.new

    render 'new'
  end

  def create
    @chat = SupportChat.find_or_initialize_by user_name: chat_params[:user_name]
    @chat.assign_attributes(chat_params)
    @chat.save!

    # this user created the chat so we'll assign a unique ID to them to associate with messages
    assign_chatter_uuid @chat.chatter_uuid

    redirect_to @chat
  end

  def show
    assign_chatter_uuid unless chatter_uuid
    @chat = SupportChat.find(params[:id])
  end

  def index
    @support_chats = SupportChat.all.order(:updated_at)
  end

  private

  def chat_params
    params.require(:support_chat).permit(:user_name)
  end

  def current_chat_id
    session[:current_chat_id]
  end

  def assign_chatter_uuid(uuid = nil)
    uuid = SupportChat.new_chatter_uuid if uuid.nil?

    session[:chatter_uuid] = uuid
  end

end
