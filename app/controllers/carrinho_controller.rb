class CarrinhoController < ApplicationController
  def index
    @produtos = current_user.produtos_carrinho # Altere para a relação correta entre usuários e produtos no seu modelo
  end
end
