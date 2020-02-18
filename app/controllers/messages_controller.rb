class MessagesController < ApplicationController
  def create
    @chatroom = ChatRoom.find(params[:chat_room_id])
    @message = Message.new(message_params)
    @message.chat_room = @chatroom
    @message.user = current_user
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: { message: @message })
      )
      redirect_to chat_room_path(@chatroom)
    else
      render "chatrooms/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
