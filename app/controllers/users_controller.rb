class UsersController < ApplicationController
  before_filter :authenticate_user!, except: :show

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @videos = @user.videos.paginate(page: params[:page], per_page: 10, order: 'rating DESC') 
    # @videos1 = @user.videos.paginate(page: params[:page], per_page: 10, order: 'created_at DESC') 
    # User.paginate :page => params[:page], :per_page => 10, :order => 'name ASC'
  end
  
  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
    
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end
end