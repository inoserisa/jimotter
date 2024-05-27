class PostsController < ApplicationController

  def index
    # @posts = Post.all.includes(:user,:prefecture,:city).order(created_at: :desc)
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).includes(:user, :prefecture, :city)

    @prefecture_id = params[:q][:prefecture_id_eq] if params[:q].present?
    @city_id = params[:q][:city_id_eq] if params[:q].present?

    @prefecture = Prefecture.find_by(id: @prefecture_id) if @prefecture_id.present?
    @city = City.find_by(id: @city_id) if @city_id.present?

    @count = @posts.count
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
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order(created_at: :desc)
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
