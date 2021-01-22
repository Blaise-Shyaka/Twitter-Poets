class Tweet < ApplicationRecord
  validates_presence_of :text
  belongs_to :user, foreign_key: :author_id
end
