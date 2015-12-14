class User < ActiveRecord::Base
  has_secure_password
  has_many :friends

  validates :name, presence: true
  validates :email, presence: true


  def my_friends
    # user = current_user
    friends = Friend.where(:fromuser_id => self.id )
    users = []
    friends.each do |friend|
      users << User.find(friend.touser_id)
    end

    users
  end

end
