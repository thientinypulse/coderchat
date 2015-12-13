class MessagesController < ApplicationController
  def index
  end

  def sent
    @messages = Message.where( sender_id: session[:user_id]).order(created_at: :desc)
  end

  def new
    user = current_user

    @message = Message.new
    @my_friends = user.my_friends
  end

  def sending
    # params['message']
    message = Message.new
    message.title = params[:message][:title]
    message.content = params[:message][:content]
    message.recipient_id = params[:message][:recipient_id]
    message.sender_id = session[:user_id]
    message.status = false
    message.save!

    redirect_to :messages_sent
  end

end
