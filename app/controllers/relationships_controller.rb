class RelationshipsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @video = Video.find(params[:relationship][:video_id])
    current_user.like!(@video)
    respond_to do |format|
      format.html {redirect_to @video}
      format.js
    end
  end

  def destroy
    @video = Relationship.find(params[:id]).video
    current_user.unlike!(@video)
    respond_to do |format|
      format.html { redirect_to @video }
      format.js
    end
  end

end
