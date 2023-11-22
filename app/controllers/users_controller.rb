class UsersController < ApplicationController
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
      redirect_to @user, notice: "User updated successfully"
    else
      render :edit
    end
  end
  
   private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end
