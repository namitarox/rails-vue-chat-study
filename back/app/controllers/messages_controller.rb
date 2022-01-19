class MessagesController < ApplicationController
  before_action :authenticate_user!, only: ["index"]
  # before_action :authenticate_user!, only: ["index","create"]
  def index
    messages = Message.all
    messages_array = messages.map do |message|
      {
        id: message.id,
        user_id: message.user.id,
        name: message.user.name,
        content: message.content,
        email: message.user.email,
        created_at: message.created_at,
        likes: message.likes.map { |like| { id: like.id, email: like.user.email }  }
      }
    end
    render json: messages_array, status: 200
  end

  # def create
  #   user = User.find_by(email: params[:email])

  #   if message = Message.create(content: params[:message], user_id: user.id)
  #     ActionCable.server.broadcast 'room_channel', { message:message }
  #   end

  # end

  # private

  # def message_prams
  #   params.require(:message).permit(:email,:message)
  # end


end
