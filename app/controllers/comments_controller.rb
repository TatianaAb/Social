class CommentsController < ApplicationController
  def create
    @post = Post.find_by_id(comment_params[:post_id])
    @comment = @post.comments.new(comment: comment_params[:comment], commenter_id: current_user.id, post_id: comment_params[:post_id])
    if @comment.save
      redirect_to user_path(params[:id])
    else
      @errors = @comment.errors.full_messages
      redirect_to user_path(params[:id])
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end
end

