class HomeController < ApplicationController
  def index
  	@sliders = Slider.all
    @featureds = Featured.all
    @projects = Project.where(featured:true)
  end

  def contact
  end

  def plans
  end
  
end
