class UsersController < ApplicationController

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  def login
    if current_user
      flash.now[:notice] = "You are already logged in."
    end
  end


  def authenticate
    user = User.find_by(email: params[:email])

    if user
      user.update(logged_in: true) # Atualiza o status de login do usuário para true
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully"
    else
      flash.now[:alert] = "Invalid email"
      render :login
    end
  end




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
