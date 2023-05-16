class UsersController < ApplicationController


  def user_index
    @user = User.all
  end

  def register
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # Redirecionar para a página de sucesso ou fazer outras ações necessárias
      redirect_to root_path, notice: "User created successfully"
    else
      # Caso haja erros de validação, renderizar novamente o formulário com as mensagens de erro
      render :register
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
