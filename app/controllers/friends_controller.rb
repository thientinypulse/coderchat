class FriendsController < ApplicationController
  def index
    @users = User.all.shuffle
  end

  def addfriend

    friend_id = params[:friend_id]
    my_id = session[:user_id]

    friend = Friend.new
    friend.fromuser_id = my_id
    friend.touser_id = friend_id

    friend.save!

    friend = Friend.new
    friend.touser_id = my_id
    friend.fromuser_id = friend_id

    friend.save!

    render 'myfriend'

  end

  def myfriend
    
  end
end
