class UsersController < ApplicationController
  # 24日　追加
  # :authenticate_user!`は、ユーザーが認証されているかどうかを確認するためのメソッドを呼び出す。
  # メソッドは、ユーザーがログインしていない場合に、ログインページにリダイレクトする。
  before_action :authenticate_user!
  
  before_action :is_matching_login_user, only: [:edit, :update]
  
  
  def edit
    @user = User.find(params[:id])
  end
  

  def show
    @book = Book.new
    @user = User.find(params[:id])
    
  end
  
  def index
    @book = Book.new
    @users = User.all
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # @user`は、`User`モデルのインスタンスであるため、そのインスタンスの情報を表示するための詳細ページにリダイレクトすることが一般的
      # redirect_to`メソッドのオプションとしてnotice指定されており、フラッシュメッセージを表示するために使用される。
      flash[:notice] = "You have updated user successfully."
      redirect_to @user
    else
      render :edit
    end
  end
  
  
  
   private


  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def is_matching_login_user
    @user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(@user)
    end
  end
  
end
