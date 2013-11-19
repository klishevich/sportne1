class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :video
  attr_accessible :body
end
