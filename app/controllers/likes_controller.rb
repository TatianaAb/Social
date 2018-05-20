class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.create(user_id: current_user.id, like_status: 1)
    redirect_to user_path(@post.receiver_id)
  end

  def destroy
    @like =  Like.find_by(user_id:current_user.id)
    @post = Post.find_by(id: @like.likeable_id)
    @like.destroy
    redirect_to user_path(@post.receiver_id)
  end
end
