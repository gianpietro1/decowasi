class FavoritesController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    favorite = current_user.favorites.build(project: @project)

    if favorite.save
      flash[:notice] = "You have favorited this post"
      redirect_to root_path
    else
      flash[:error] = "There was an error favorting the post. Please try again."
      redirect_to root_path
    end 
  end

  def destroy
    @project = Project.find(params[:project_id])
    favorite = current_user.favorites.find(params[:id])

    if favorite.destroy
      flash[:notice] = "You have unfavorited the post."
      redirect_to root_path
    else
      flash[:error] = "There was an error unfavoriting the post."
      redirect_to root_path
    end
  end
end