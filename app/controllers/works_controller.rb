class WorksController < ApplicationController

  before_filter :correct_user, only: [:edit, :update, :destroy]

  def index
    @works = current_user.works
  end

  def create
    @user = current_user
    @work = @user.works.create(params[:work])
    if(@work.valid?)
      redirect_to user_work_path(@user,@work), notice: t(:work_was_successfully_created)
    else
      render action: "new"
    end
  end

  def show
    @work = Work.find(params[:id])
    @user = @work.user
  end

  def new
    @user = current_user
    @work = @user.works.new
  end

  def edit
  	@user = current_user
    @work = Work.find(params[:id])
  end

  def update
  	@user = current_user
    @work = Work.find(params[:id])

    if @work.update_attributes(params[:work])
      redirect_to user_work_path(@user,@work), notice: t(:work_was_successfully_updated)
    else
      render action: "edit"
    end
  end

  def destroy
    @user = current_user
    @work = Work.find(params[:id])
    @work.destroy

    redirect_to @user
  end

  private 

  def correct_user
    @work = current_user.works.find_by_id(params[:id])
    redirect_to root_url if @work.nil?
  end

end
