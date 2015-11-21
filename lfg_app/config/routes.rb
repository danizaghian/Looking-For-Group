Rails.application.routes.draw do
  root to: "welcome#index"

  resources :genres
  resources :games
  resources :users
  resources :groups
  
  # temporary route to get messages working
  get "/users/:id/send_message", to:  "users#send_message"

  post "/users/:id/send_message", to: "users#sent_message"
  #this shows a list of groups through a specific user
  get "/users/:user_id/groups", to: "group_users#index", as: "user_groups"


  get "/users/:user_id/inbox", to: "users#inbox"

  #this shows a list of games through a specific selected genre
  get "/genre/:genre_id/games", to: "game_genres#show", as: "genre_games"
  get "/genre/:genre_id/users", to: "user_genres#show", as: "genre_users"

  get "/login", to: "sessions#new"

  post "/sessions", to: "sessions#create"

  post "/logout", to: "sessions#destroy"

end
