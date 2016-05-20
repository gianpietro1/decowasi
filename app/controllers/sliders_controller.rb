class SlidersController < ApplicationController
  
  def index
    @sliders = Slider.all
  end

  def new
    @slider = Slider.new
  end

  def edit
    @slider = Slider.find(params[:id])
  end

  def create
    @slider = Slider.new(slider_params)
    if @slider.save
      redirect_to sliders_path, notice: "El slider fue creado exitosamente."
    else
      flash[:error] = "Error al crear slider."
      render :new
    end
  end

  def update
    @slider = Slider.find(params[:id])
    if @slider.update_attributes(slider_params)
      redirect_to sliders_path
    else
      flash[:error] = "Error al actualizar slider."
      render :edit
    end
  end

  def destroy
    @slider = Slider.find(params[:id])
    if @slider.destroy
      flash[:notice] = 'Slider borrado'
      redirect_to sliders_path
    else
      flash[:error] = 'Error al borrar Slider'
      render :edit
    end
  end

  private
 
  def slider_params
     params.require(:slider).permit(:title, :image)
  end

end
