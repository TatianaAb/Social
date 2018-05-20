module LikesHelper
  def liked?(post)
    post.likes.find_by(user_id: current_user.id, like_status: 1)
  end
end

