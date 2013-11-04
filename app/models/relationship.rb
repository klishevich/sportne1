class Relationship < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :video_id

  belongs_to :user, class_name: "User"
  belongs_to :video, class_name: "Video"

  validates :user_id, presence: true

  validates :video_id, presence: true

end
