module PostsHelper
	def post_sender?(post)
    current_user.id == post.sender_id
  end
end
