class Work < ActiveRecord::Base
  belongs_to :video
  belongs_to :user
  attr_accessible :description, :mark
end
