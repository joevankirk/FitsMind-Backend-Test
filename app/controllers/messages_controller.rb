class MessagesController < ApplicationController
  before_action :set_chat, only:[:index, :create]
  before_action :authenticate_user!

  def index
    # show all messages
    @messages = @chat.messages.all
    @messages = @messages.sort_by(&:created_at)
    @messages = @messages.last(10)

    if current_user.id == @chat.user_1_id
      recipient_id = @chat.user_2_id
      @recipient = User.find(recipient_id)
    else
      recipient_id = @chat.user_1_id
      @recipient = User.find(recipient_id)
    end
    # @message = current_user.messages.build
  end

  def create
    @message = current_user.messages.build(message_params)
    @message.save
  end

  private

  def set_chat
    @chat = Chat.find(params[:chat_id])
  end

  def message_params
    params.require(:message).permit(:content, :sender_id, :recipient_id, :chat_id)
  end
end
