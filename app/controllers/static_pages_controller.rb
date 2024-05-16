class StaticPagesController < ApplicationController
  def top
    @posts = Post.order(created_at: :desc).limit(10)
    @prefecture = Prefecture.all
  end
end