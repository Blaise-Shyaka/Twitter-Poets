class Upvote < ApplicationRecord
  validates_presence_of :user_id, :tweet_id
  belongs_to :user
  belongs_to :tweet
end
