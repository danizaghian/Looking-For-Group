Rails.application.routes.draw do
  resources :games

  resources :users

  resources :groups
end
