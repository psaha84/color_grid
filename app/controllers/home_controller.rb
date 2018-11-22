class HomeController < ApplicationController
  def index
  end  

  def create_palette
    current_user.palettes.create(palette_params)
  end  

  protected

  def palette_params
    params.require(:palette).permit(:color, :row, :col)
  end
end
