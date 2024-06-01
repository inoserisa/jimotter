class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @comment.post = Post.find(params[:post_id])
    @comment.save
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy!
  end

  private


  def comment_params
    params.require(:comment).permit(:comment_content).merge(post_id: params[:post_id])
  end
end
