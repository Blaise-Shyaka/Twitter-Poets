class Tweet < ApplicationRecord
  validates_presence_of :text
  belongs_to :author, class_name: :User
end
