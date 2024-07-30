class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc).page(params[:page]).per(5)
    @questions = @user.questions.order(created_at: :desc).page(params[:page]).per(5)
    @bookmark_posts = @user.bookmark_posts.includes(:user).order(created_at: :desc).page(params[:page]).per(5)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: '退会しました', status: :see_other
  end
end
