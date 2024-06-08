class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
    @questions = @user.questions.order(created_at: :desc)
  end
end
