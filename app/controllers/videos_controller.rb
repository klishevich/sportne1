class VideosController < ApplicationController

  def index
    @videos = current_user.videos
  end

  def create
    @user = current_user
    @video = @user.videos.create(params[:video])
    if(@video.valid?)
      redirect_to user_video_path(@user,@video), notice: t(:video_was_successfully_created)
    else
      render action: "new"
    end
  end

  def show
    @user = current_user
    @video = Video.find(params[:id])
  end

  def new
    @user = current_user
    @video = @user.videos.new
  end

  def edit
  	@user = current_user
    @video = Video.find(params[:id])
  end

  def update
  	@user = current_user
    @video = Video.find(params[:id])

    if @video.update_attributes(params[:video])
      redirect_to user_video_path(@user,@video), notice: t(:video_was_successfully_updated)
    else
      render action: "edit"
    end
  end

  def destroy
    @user = current_user
    @video = Video.find(params[:id])
    @video.destroy

    redirect_to @user
  end

end
