class User < ApplicationRecord
  validates_presence_of :username, uniqueness: true
  validates_presence_of :fullname
  validates_length_of :username, minimum: 3, maximum: 20
  validates_length_of :fullname, minimum: 3, maximum: 45
  has_many :tweets, foreign_key: :author_id
  has_many :follows_as_followed, foreign_key: :followed_id, class_name: "Following"
  has_many :followers, through: :follows_as_followed, source: :follower
  has_many :follows_as_follower, foreign_key: :follower_id, class_name: "Following"
  has_many :followeds, through: :follows_as_follower, source: :followed
  has_many :upvotes
end
