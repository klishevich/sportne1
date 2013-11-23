class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :video
  attr_accessible :body

  validates :body, presence: true

  default_scope order("comments.created_at DESC")
end
