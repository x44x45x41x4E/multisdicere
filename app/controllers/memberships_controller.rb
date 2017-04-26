class MembershipsController < ApplicationController
  before_action :set_room

  def create
    @memberships = @room.memberships.where(user_id: current_user.id).first_or_create
    redirect_to @room
  end

  def destroy
    @memberships = @room.memberships.where(user_id: current_user.id).destroy_all
    redirect_to rooms_path
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end
end
