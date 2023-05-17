Rails.application.routes.draw do

  delete "logout", to: "sessions#destroy", as: :logout


  resources :users, only: [:create]

  get "user_index", to: "users#user_index"
  get "register", to: "users#register", as: :register

  get "login", to: "users#login"
  post "authenticate", to: "users#authenticate"

  resources :produtos, only: [:show]

  get "show", to: "produtos#show"
  get "produtos/busca", to: "produtos#busca", as: :busca_produto
  get "index", to: "produtos#index"
  delete "produtos/:id", to: "produtos#destroy", as: :delete_produto
  post "produtos", to: "produtos#create"
  get "new", to: "produtos#new"
  root to: "produtos#home"
end
