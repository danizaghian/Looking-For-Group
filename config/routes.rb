  Rails.application.routes.draw do
  root to: "welcome#index"
  get "/about", to: "welcome#show"

  resources :genres
  resources :games
  resources :users
  resources :groups
  
  # temporary route to get messages working
  get "/users/:id/send_message", to:  "users#send_message"

  post "/users/:id/send_message", to: "users#sent_message"
  #this shows a list of groups through a specific user
  get "/users/:user_id/groups", to: "group_users#index", as: "user_groups"

  post "/groups/:group_id/join", to: "groups#join"
  post "/groups/:group_id/leave", to: "groups#leave"



  get "/users/:user_id/inbox", to: "users#inbox", as:"inbox"

  #this shows a list of games through a specific selected genre
  get "/genres/:genre_id/games", to: "game_genres#show", as: "genre_games"

  get "/home", to: "user_genres#show", as: "mygroups"


  post "/games/:id/adduser", to: "games#adduser"

  get "/login", to: "sessions#new"

  post "/sessions", to: "sessions#create"

  post "/logout", to: "sessions#destroy"

end
