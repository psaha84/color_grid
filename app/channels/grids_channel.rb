class GridsChannel < ApplicationCable::Channel  
  def subscribed
    stream_from 'grids'
  end
end
