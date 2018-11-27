class HomeController < ApplicationController
  def index
  end  

  def leaderboard
    # get all the user along with their favourite color
    @users = User.get_record_along_with_fav_color
  end

  def create_palette
    @palette = current_user.palettes.new(palette_params)

    if @palette.save
      ActionCable.server.broadcast 'grids', grid: @palette.to_json
    end  
  end  

  protected

  def palette_params
    params.require(:palette).permit(:color, :row, :col)
  end
end
