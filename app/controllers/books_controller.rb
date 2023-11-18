class BooksController < ApplicationController
  def show
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
    @book.save
    # 詳細画面へリダイレクト
    redirect_to book_path(@book)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

 private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
