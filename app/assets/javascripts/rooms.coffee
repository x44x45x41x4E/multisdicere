$(document).on "turbolinks:load", ->

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
