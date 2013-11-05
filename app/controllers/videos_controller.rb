class VideosController < ApplicationController

  before_filter :correct_user, only: [:edit, :update, :destroy]

  def popular_videos
    @user=current_user
    @videos = Video.paginate(page: params[:page], per_page: 10, order: 'rating DESC') 
  end

  def recent_videos
    @user=current_user
    @videos = Video.paginate(page: params[:page], per_page: 10, order: 'created_at DESC') 
  end

  def index
    @videos = current_user.videos
  end

  def index1
    @user=current_user
    if params[:tag]
      @videos = Video.tagged_with(params[:tag])
    else
      @videos = Video.all
    end
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
    @video = Video.find(params[:id])
    @user = @video.user
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

  private 

  def correct_user
    @video = current_user.videos.find_by_id(params[:id])
    redirect_to root_url if @video.nil?
  end

end
