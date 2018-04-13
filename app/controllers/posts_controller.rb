class PostsController < ApplicationController
	def create
    @post = current_user.posts.new(content:post_params[:content], receiver_id: params[:id])
    if @post.save
      redirect_to user_path(params[:id])
    else
      @errors = @post.errors.full_messages
      redirect_to user_path(params[:id])
    end
  end

  def edit
      @post = Post.find_by_id(params[:id])
    if @post
      render "/posts/edit"
    end
  end

  def update
    @post = Post.find_by_id(params[:id])
    if authorized?(@post.sender_id) && @post.update(content: params[:content])
      redirect_to user_path(@post.receiver_id)
    end
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    @id = @post.receiver_id
    if authorized?(@post[:sender_id])
      @post.destroy
    end
    redirect_to user_path(@id)
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
