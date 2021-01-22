class User < ApplicationRecord
  validates_presence_of :username
  validates_presence_of :fullname
  validates_length_of :username, minimum: 3, maximum: 20
  validates_length_of :fullname, minimum: 3, maximum: 45
  has_many :tweets, foreign_key: :author_id
  has_many :followers, through: :followings, foreign_key: :follower_id
  has_many :followings, through: :followings
end
