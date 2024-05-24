class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to post_path(@post), notice: 'コメントが追加されました'
    else
      redirect_to post_path(@post), alert: 'コメントに失敗しました'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content)
  end
end
