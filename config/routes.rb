Rails.application.routes.draw do

  resources :users, only: [:create] do
    member do
      post 'add_to_cart/:produto_id', to: 'users#add_to_cart', as: 'add_to_cart'
      delete 'remover_do_carrinho/:produto_id', to: 'users#remover_do_carrinho', as: 'remover_do_carrinho'
    end

  end

  get 'carrinho', to: 'users#carrinho'

  delete "logout", to: "sessions#destroy", as: :logout

  resources :users, only: [:create, :show] do
    member do
      post 'add_to_wallet'
      post 'deduct_from_wallet'
    end
  end

  get "carteira", to: "users#carteira"

  resources :users, only: [:create]

  get "user_index", to: "users#user_index"
  get "register", to: "users#register", as: :register

  get "login", to: "users#login"
  post "authenticate", to: "users#authenticate"
  delete "users/:id", to: "users#destroy", as: :delete_user


  resources :produtos, only: [:show]

  get "show", to: "produtos#show"
  get "produtos/busca", to: "produtos#busca", as: :busca_produto
  get "index", to: "produtos#index"
  delete "produtos/:id", to: "produtos#destroy", as: :delete_produto
  post "produtos", to: "produtos#create"
  get "new", to: "produtos#new"
  root to: "produtos#home"
end
