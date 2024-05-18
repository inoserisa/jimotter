class PostsController < ApplicationController

  def index
    @posts = Post.all.includes(:user,:prefecture,:city).order(created_at: :desc)
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
    else
      flash[:alert]
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit; end

  def destroy
    @post.destroy
    redirect_to root_path, status: :see_other  
  end

  private

  def post_params
    params.require(:post).permit(:prefecture_id, :city_id, :content)
  end
end
