class BooksController < ApplicationController
   before_action :is_matching_login_user, only: [:edit, :update]
  
  def show
    # 一意のidを持つbookモデルのレコードを抽出
    @book_show = Book.find(params[:id])
    # 新規投稿フォーム用インスタンス
    @book = Book.new
  end

  def index
    # 新規投稿フォーム用インスタンス
    @book = Book.new
    # メモ：下記のように、current_userを指定することで、Userモデルのcurrent_user情報を持ってこれる。
    @user = current_user
    # 投稿一覧データの取得
    @books = Book.all
  end

  def create
    # データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # use_idカラムにcurrent_user.idを代入
    @book.user_id = current_user.id
    # データをデータベースに保存するためのsaveメソッド実行
    if @book.save
    # 詳細画面へリダイレクト
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book)
    else
    @user = current_user
    @books = Book.all
    render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    # updateはnewと異なり、既存のレコードを抽出する必要があるため、params[:id]を引数に指定する必要がある。
    @book = Book.find(params[:id])

    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
  redirect_to books_path
  end
end

 private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
 def is_matching_login_user
  @book = Book.find(params[:id])
  unless @book.user_id == current_user.id
    redirect_to books_path
  end
 end
