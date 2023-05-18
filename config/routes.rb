Rails.application.routes.draw do
  root to: 'produtos#home'

  # Rotas de usuários
  resources :users, only: [:create, :show, :destroy] do
    member do
      post 'add_to_cart/:produto_id', to: 'users#add_to_cart', as: 'add_to_cart'
      delete 'remover_do_carrinho/:produto_id', to: 'users#remover_do_carrinho', as: 'remover_do_carrinho'
      post 'add_to_wallet'
      post 'deduct_from_wallet'
    end
  end
  get 'user_index', to: 'users#user_index'
  get 'register', to: 'users#register', as: :register
  get 'login', to: 'users#login'
  post 'authenticate', to: 'users#authenticate'
  delete 'users/:id', to: 'users#destroy', as: :delete_user
  get 'carteira', to: 'users#carteira'
  get 'carrinho', to: 'users#carrinho', as: :carrinho



  # Rotas de produtos
  resources :produtos, only: [:show, :index, :create, :destroy]
  get 'produtos/busca', to: 'produtos#busca', as: :busca_produto
  get 'new', to: 'produtos#new'
  get 'produtos', to: 'produtos#index', as: :index

  # Rota de logout
  delete 'logout', to: 'sessions#destroy', as: :logout
end
