class HomeController < ApplicationController
  def index
  	@sliders = Slider.all
    @featureds = Featured.all
  end

  def contact
  end
end
