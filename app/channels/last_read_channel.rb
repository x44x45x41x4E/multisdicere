class LastReadChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def update data
    membership = current_user.memberships.find_by(joinable_id: data["room_id"], joinable_type: "Room")
    membership.update(last_read_at: Time.zone.now)
  end
end
