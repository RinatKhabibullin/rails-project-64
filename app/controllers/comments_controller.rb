class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.creator = current_user

    @comment.save

    redirect_to @post
  end

  private

  def comment_params
    params.require(:post_comment).permit(:content, :user_id, :post_id, :parent_id)
  end
end
