class Friend < ActiveRecord::Base
  belongs_to :fromuser, :class_name => 'User', foreign_key: "fromuser_id"
  belongs_to :touser, :class_name => 'User', foreign_key: "touser_id"
end
