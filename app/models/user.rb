class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :videos
  has_many :relationships, foreign_key: "user_id", dependent: :destroy
  has_many :liked_videos, through: :relationships, source: :video

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  def like?(video)
    relationships.find_by_video_id(video.id)
  end

  def like!(video)
    relationships.create(video_id: video.id)
  end

  def unlike!(video)
    relationships.find_by_video_id(video.id).destroy
  end  
  
end
