class FeaturedsController < ApplicationController
  
  def index
    @featureds = Featured.all
  end

  def new
    @featured = Featured.new
  end

  def edit
    @featured = Featured.find(params[:id])
  end

  def create
    @featured = Featured.new(featured_params)
    if @featured.save
      redirect_to featureds_path, notice: "El destacado fue creado exitosamente."
    else
      flash[:error] = "Error al crear destacado."
      render :new
    end
  end

  def update
    @featured = Featured.find(params[:id])
    if @featured.update_attributes(featured_params)
      redirect_to featureds_path
    else
      flash[:error] = "Error al actualizar destacado."
      render :edit
    end
  end

  def destroy
    @featured = Featured.find(params[:id])
    if @featured.destroy
      flash[:notice] = 'Destacado borrado'
      redirect_to featureds_path
    else
      flash[:error] = 'Error al borrar destacado'
      render :edit
    end
  end

  private
 
  def featured_params
     params.require(:featured).permit(:title,:description,:image,:link)
  end

end
