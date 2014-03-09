class ProfileController < ApplicationController
  def index
  	@user=current_user
    @my_videos = current_user.videos.limit(10).order('created_at DESC')  	
    @my_works = current_user.works.limit(10).order('created_at DESC')  
  end

  def works
    @works = current_user.works.limit(100).order("created_at")

    respond_to do |format|
      format.html
      format.json { render :json => @works.to_json }
    end   	
  end
end
