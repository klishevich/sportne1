class Video < ActiveRecord::Base
  attr_accessible :description, :name, :src
  belongs_to :user
end
