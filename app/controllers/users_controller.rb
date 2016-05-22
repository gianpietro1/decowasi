class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  respond_to :html, :js
  
  def show
    @user = User.find(params[:id])
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to edit_user_registration_path
    else
      flash[:error] = "Invalid user information"
      redirect_to edit_user_registration_path
    end
  end

  def follow
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    follows = @user.followers.count
    respond_with(follows) do |format|
      format.html {render :partial => "follow" }
    end
  end

  def unfollow
    @user = User.find(params[:user_id])
    current_user.unfollow(@user)
    follows = @user.followers.count
    respond_with(follows) do |format|
      format.html {render :partial => "unfollow" }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :description, :avatar, :cover)
  end
end
