class MessageSenderJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "rooms:#{message.room.id}", {
      # message: MessagesController.render(message),
      name: "#{message.sender.first_name} #{message.sender.last_name}",
      body: message.body,
      room_id: message.room.id
    }
  end
end
