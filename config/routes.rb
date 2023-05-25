Rails.application.routes.draw do

  resources :rooms

  root 'pages#home'

  devise_for :users
  get "user/:id", to: "users#show", as: "user"

end
