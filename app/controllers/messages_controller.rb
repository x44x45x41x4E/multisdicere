class MessagesController < ApplicationController
  before_action :set_room

  def create
    message = @room.messages.new(message_params)
    message.sender = current_user
    message.save
    MessageSenderJob.perform_later(message)
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def message_params
    params.require(:message).permit(:body)
  end
end
