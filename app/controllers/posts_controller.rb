class PostsController < ApplicationController
  def index
    # @posts = Post.all.includes(:user,:prefecture,:city).order(created_at: :desc)
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).includes(:user, :prefecture, :city).order(created_at: :desc).page(params[:page]).per(10)

    @prefecture_id = params[:q][:prefecture_id_eq] if params[:q].present?
    @city_id = params[:q][:city_id_eq] if params[:q].present?

    @prefecture = Prefecture.find_by(id: @prefecture_id) if @prefecture_id.present?
    @city = City.find_by(id: @city_id) if @city_id.present?

    @count = @posts.count
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def new
    @post = Post.new
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: t('.success')
    else
      flash.now[:alert] = t('.failed')
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: t('.success')
    else
      flash.now[:alert] = t('failed')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy!
    redirect_to root_path, status: :see_other, notice: t('.success')
  end

  def bookmarks
    @bookmark_posts = current_user.bookmark_posts.includes(:user).order(created_at: :desc)
  end

  private

  def post_params
    params.require(:post).permit(:prefecture_id, :city_id, :content)
  end
end
