class CommentsController < ApplicationController
	before_filter :correct_user, only: [:destroy]
	before_filter :authenticate_user!, only: [:create, :destroy]

	def create
		@video=Video.find(params[:video_id])
		@comment = @video.comments.new(params[:comment])
		@comment.user = current_user
		@comment.save
		respond_to do |format|
	      format.html { redirect_to user_video_path(@video.user, @video) }
	      format.js
	    end		
	end

	def show
		@video=Video.find(params[:video_id])
		@comment = @video.comments.find(params[:comment_id])
	end

	def destroy
		@video=Video.find(params[:video_id])
		@comment=@video.comments.find(params[:id])
		@comment.destroy
		respond_to do |format|
	      format.html { redirect_to user_video_path(@video.user, @video) }
	      format.js
	    end
	end

  def correct_user
    @comment = current_user.comments.find_by_id(params[:id])
    redirect_to root_url if @comment.nil?
  end

end
