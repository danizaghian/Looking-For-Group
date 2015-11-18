Rails.application.routes.draw do
  resources :genres
  resources :games
  resources :users
  
  get "/genre/:genre_id/games", to: "game_genres#index", as: "genre_games"

end
