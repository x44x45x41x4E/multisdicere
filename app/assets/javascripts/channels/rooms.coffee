App.rooms = App.cable.subscriptions.create "RoomsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    active_chatroom = $("[data-behavior='messages'][data-room-id='#{data.room_id}']")
    if active_chatroom.length > 0
      active_chatroom.append(data.message)
    else
      $("[data-behavior='room-link'][data-room-id='#{data.room_id}']").css('font-weight', 'bold')
    # Called when there's incoming data on the websocket for this channel

  send_message: (room_id, message) ->
    @perform "send_message", {room_id: room_id, body: message}
