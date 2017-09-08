class ChatsController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_user, only: [ :new, :create, :index ]

  def index
    user1_chats = Chat.where(user_1_id: @user.id)
    user2_chats = Chat.where(user_2_id: @user.id)

    @chats = user1_chats + user2_chats
  end

  def new
    @chat = current_user.chats.new
    @chats = Chat.all
    # @users = User.all
  end

  def create
    @chat = Chat.new(chat_params)
    @message = @chat.build_messages(message_params)
    @message.save
  end

  private

  def chat_params
    params.require(:chat).permit(:user_1_id, :user_2_id)
  end

  def set_chat
    @chat = Chat.find(params[:id])
  end

  def set_user
    @user = User.find(current_user[:id])
  end

  def message_params
    params.require(:message).permit(:content, :sender_id, :recipient_id, :chat_id)
  end

end
