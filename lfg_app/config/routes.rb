Rails.application.routes.draw do
  resources :genres
  resources :games
  resources :users
  resources :groups

  get "/users/:user_id/groups", to: "group_users#index", as: "user_groups"

  get "/genre/:genre_id/games", to: "game_genres#index", as: "genre_games"

end
