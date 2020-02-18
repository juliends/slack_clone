class ChatRoomsController < ApplicationController
  def show
    @chatroom = ChatRoom.find(params[:id])
    @message = Message.new # => We want to create a message from the show
  end
end
