class CommentsController < ApplicationController
	before_filter :correct_user, only: [:destroy]
	before_filter :authenticate_user!, only: [:create, :destroy]

	# def new
	#     @video=Video.find(params[:video_id])
	#     @comment = @video.comments.new
	# end		

	def create
		@video=Video.find(params[:video_id])
		@comment = @video.comments.new(params[:comment])
		@comment.user = current_user
		@video=Video.find(params[:video_id]) unless @comment.save
		@comments = @video.comments.paginate(page: params[:page], per_page: 10, order: 'created_at DESC')
		respond_to do |format|
	      format.html { 
	      	if @comment.save 
	      		redirect_to user_video_path(@video.user, @video), notice: t(:comment_was_successfully_created)
	      	else 
	      		@video=Video.find(params[:video_id])
	      		flash[:error] = t(:comment_cant_be_empty)
	      		redirect_to user_video_path(@video.user, @video)
	      	end
	      }
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
		@comments = @video.comments.paginate(page: params[:page], per_page: 10, order: 'created_at DESC')
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
