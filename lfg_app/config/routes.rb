Rails.application.routes.draw do
  resources :genres
  resources :games
  resources :users
  resources :groups

  get "/users/:user_id/groups", to: "group_users#index", as: "user_groups"

  get "/genre/:genre_id/games", to: "game_genres#index", as: "genre_games"

  get "/login", to: "sessions#new"

  post "/sessions", to: "sessions#create"

  post "/logout", to: "sessions#destroy"


end
