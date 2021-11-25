class BooksController < ApplicationController
  before_action :authenticate_user!
  # ログイン済ユーザーのみにアクセスを許可する
  # コントローラーの先頭に記載することで、そこで行われる処理はログインユーザーによってのみ実行可能となる
  before_action :current_user, only: [:edit, :update]
  # サインインしているユーザーを取得する

  def update
    @book = Book.find(params[:id]) # 何を更新存するのかを指定

    if @book.update(book_params) # 更新ができたら
      flash[:notice] = "You have updated book successfully."
      # サクセスメッセージを表示
      redirect_to book_path(@book.id) # 投稿詳細画面へ遷移
    else # でなければ
       render :edit # editへ遷移
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = current_user
    @books = Book.all
    if @book.save
     redirect_to book_path(@book),notice:"Book was successfully updated."
    else
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @booknew = Book.new
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path,notice:"Book was successfully destroy."
  end

  private

   def book_params
    params.require(:book).permit(:title, :body)
   end

end