class BooksController < ApplicationController
  def show
  end

  def index
    # 新規投稿フォーム用インスタンス
    @book = Book.new
    
    @user = current_user
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
