class HomeController < ApplicationController
  def index
  	@user=current_user
    @users = User.all
    @popular_videos = Video.limit(10).order('rating desc')
    @recent_videos = Video.limit(10).order('created_at DESC')
  end
end
