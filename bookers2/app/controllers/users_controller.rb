class UsersController < ApplicationController
  before_action :authenticate_user!
  # ログイン済ユーザーのみにアクセスを許可する
  # コントローラーの先頭に記載することで、そこで行われる処理はログインユーザーによってのみ実行可能となる

  def show
   @user = User.find(params[:id])
   @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    
    # if @user != current_user
    if @user == current_user
    # redirect_to user_path(current_user)
    render :edit
    else
    redirect_to user_path(current_user)
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @users = User.all
    @user = current_user
  end

 def update
   @user = User.find(params[:id])
   if @user.update(user_params)
       redirect_to user_path(@user),notice:"User was successfully updated."
   else
     render:edit
   end
 end



private

   def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
   end
end