class ProfileController < ApplicationController
  def index
  	@user=current_user
    @my_videos = current_user.videos.limit(10).order('created_at DESC')  	
    @my_works = current_user.works.limit(10).order('created_at DESC')  
  end
end
