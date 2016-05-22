class ProjectsController < ApplicationController

  respond_to :html, :js
  
  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to user_path(current_user), notice: "El proyecto fue creado exitosamente."
    else
      flash[:error] = "Error al crear proyecto."
      render :new
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      redirect_to user_path(current_user)
    else
      flash[:error] = "Error al actualizar proyecto."
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      flash[:notice] = 'Proyecto borrado.'
      redirect_to user_path(current_user)
    else
      flash[:error] = 'Error al borrar proyecto.'
      render :edit
    end
  end

  def like
    @project = Project.find(params[:project_id])
    current_user.likes.create(project_id: @project.id)
    @likes = @project.likes.count
    respond_with(@project,@likes) do |format|
      format.html {render :partial => "like" }
    end
  end
  
  def unlike
    @project = Project.find(params[:project_id])
    current_user.likes.where(project_id: @project.id).first.delete
    @likes = @project.likes.count
    respond_with(@project,@likes) do |format|
      format.html {render :partial => "unlike" }
   end
  end

  private
 
  def project_params
     params.require(:project).permit(:title,:description,:image,:featured)
  end

end
