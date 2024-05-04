class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    @room = Room.find(params[:id])

    # roomメンバーでなければ追い出す
    unless @room.users.pluck(:id).include?(current_user.id)
      redirect_to rooms_path
    end

    @messages = Message.where(room: @room)
                       .order(created_at: :desc)

  end
end
