Rails.application.routes.draw do

  resources :produtos, only: [:show]

  get "show", to: "produtos#show"
  get "produtos/busca", to: "produtos#busca", as: :busca_produto
  get "home", to: "produtos#home"
  delete "produtos/:id", to: "produtos#destroy", as: :delete_produto
  post "produtos", to: "produtos#create"
  get "new", to: "produtos#new"
  root to: "produtos#index"
end
