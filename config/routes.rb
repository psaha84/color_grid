Rails.application.routes.draw do
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'leaderboard', to: 'home#leaderboard', as: :leaderboard
  post 'palettes/create', to: 'home#create_palette', as: :create_palette
  root 'home#index'
end
