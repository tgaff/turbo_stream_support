class SupportChatsController < ApplicationController
  before_action :set_support_chat, only: %i[ show edit update destroy ]

  # GET /support_chats or /support_chats.json
  def index
    @support_chats = SupportChat.all
  end

  # GET /support_chats/1 or /support_chats/1.json
  def show
  end

  # GET /support_chats/new
  def new
    @support_chat = SupportChat.new
  end

  # GET /support_chats/1/edit
  def edit
  end

  # POST /support_chats or /support_chats.json
  def create
    @support_chat = SupportChat.new(support_chat_params)

    respond_to do |format|
      if @support_chat.save
        format.html { redirect_to support_chat_url(@support_chat), notice: "Support chat was successfully created." }
        format.json { render :show, status: :created, location: @support_chat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @support_chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /support_chats/1 or /support_chats/1.json
  def update
    respond_to do |format|
      if @support_chat.update(support_chat_params)
        format.html { redirect_to support_chat_url(@support_chat), notice: "Support chat was successfully updated." }
        format.json { render :show, status: :ok, location: @support_chat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @support_chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /support_chats/1 or /support_chats/1.json
  def destroy
    @support_chat.destroy

    respond_to do |format|
      format.html { redirect_to support_chats_url, notice: "Support chat was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_support_chat
      @support_chat = SupportChat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def support_chat_params
      params.require(:support_chat).permit(:customer_name)
    end
end
