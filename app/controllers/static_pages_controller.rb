class StaticPagesController < ApplicationController
  def top
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).includes(:user, :prefecture, :city).order(created_at: :desc).limit(15)
    @questions = Question.all.includes(:user).order(created_at: :desc)
  end

  def about; end
end