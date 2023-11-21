class UsersController < ApplicationController
  def edit
  end

  def show
  end
  
  def index
    @book = Book.new
    @users = User.all
  end
  
end
