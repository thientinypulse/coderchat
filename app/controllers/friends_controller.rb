class FriendsController < ApplicationController
  def index
    @users = User.all.shuffle
  end

  def addfriend

    friend_id = params[:friend_id]
    my_id = session[:user_id]

    if Friend.where(:fromuser_id => my_id, :touser_id => friend_id).present?
      flash[:warning] = 'You are friends together for a long time!'
      redirect_to :friends_index
      return
    end

    friend = Friend.new
    friend.fromuser_id = my_id
    friend.touser_id = friend_id

    friend.save!

    friend = Friend.new
    friend.touser_id = my_id
    friend.fromuser_id = friend_id

    friend.save!

    flash[:success] = 'Successfully add more friend!'
    redirect_to :friends_myfriend

  end

  def myfriend


    user = current_user
    friends = Friend.where(:fromuser_id => user.id )
    # @users = []
    #
    # friends.each do |friend|
    #
    #   @users << User.find(friend.touser_id)
    #
    # end

    @users = user.my_friends
  end
end
