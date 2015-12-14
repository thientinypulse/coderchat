class MessagesController < ApplicationController
  before_action :require_login
  def index
    @messages = Message.where(recipient_id: session[:user_id]).order(created_at: :desc)
    new_message_count = 0
    if @messages.map{|message| message.status}.include? false
      new_message_count += 1
    end
    flash[:success] = "You got #{new_message_count} new messages!" unless new_message_count==0

  end

  def sent
    @messages = Message.where(sender_id: session[:user_id]).order(created_at: :desc)
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

  def content
    message_id = params[:message_id]
    @message = Message.find(message_id)
    # @message.status = !@message.status
    @sender = User.find(@message.sender_id)

    if @message.status == true
      @message.content = ''
      flash[:warning] = "This message has been read by the recipient!"
    end
    Message.update(message_id, :status => true)
  end
end
