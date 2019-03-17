class UsersController < ApplicationController

  def new
    @user = User.new
  end 
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash.now[:success] = "ユーザーを登録しました"
      redirect_to root_path
    else
      render 'new'
    end 
  end
  
  def login_form
  end
  
  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash.now[:success] = "ログインしました"
    else
      flash.now[:danger] = "メールアドレスまたはパスワードが正しくありません"
      render 'login_form'
    end 
  end 
  
  def show
    @user = User.find(params[:id])
  end 
    
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end 

end
