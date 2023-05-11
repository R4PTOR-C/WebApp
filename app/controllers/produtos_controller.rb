class ProdutosController < ApplicationController

  before_action :set_produto, only: [:show]
  def index
    @produto = Produto.all
  end

  def new
    @produto = Produto.new
  end

  def create
    valores = params.require(:produto).permit(:nome, :descricao, :preco, :quantidade, :imagem, :marca)
    @produto = Produto.new valores
    if @produto.save
      flash[:notice] = "produto salvo com sucesso"
    redirect_to root_url
    else
      flash[:error] = "produto não foi salvo"
      render :new
      end
  end



  def destroy
    remove_id = params[:id]
    Produto.destroy remove_id
    redirect_to root_url
  end

  def busca
    @nome = params[:nome]
    @produto = Produto.where "nome like ?", "%#{@nome}%"


  end

  def show
    @produto = Produto.find(params[:id])
  end

  def set_produto
    @produto = Produto.find (params[:id])
  end

  def home
    @produto = Produto.all
  end
end
