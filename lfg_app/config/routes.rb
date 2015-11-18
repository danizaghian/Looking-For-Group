Rails.application.routes.draw do
  resources :games

  resources :users

  resources :groups

  get "/users/:user_id/groups", to: "group_users#index", as: "user_groups"
end
