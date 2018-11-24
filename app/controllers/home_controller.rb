class HomeController < ApplicationController
  def index
  end  

  def leaderboard
    @users = User.order("palettes_count desc").select("users.*, (select color from palettes where palettes.user_id = users.id  
      group by color having count(color)=(select max(t.color_count) from (select count(color) 
      color_count from palettes group by color)t)) as fav_color")
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
