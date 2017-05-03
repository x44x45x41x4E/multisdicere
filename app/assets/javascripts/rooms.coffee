handleVisibilityChange = ->
  $strike = $('.strike')
  if $strike.length > 0
    room_id = $("[data-behavior='messages']").data('room-id')
    App.last_read.update(room_id)
    $strike.remove()

$(document).on "turbolinks:load", ->
  $(document).on "click", handleVisibilityChange

  $("#new_message").on "keypress", (e) ->
    if e && e.keyCode == 13
      e.preventDefault()
      $(this).submit()

  $("#new_message").on "submit", (e) ->
    e.preventDefault()

    room_id = $("[data-behavior='messages']").data("room-id")
    body    = $("#message_body")

    App.rooms.send_message(room_id, body.val())
    body.val("")
