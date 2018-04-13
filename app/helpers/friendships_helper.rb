module FriendshipsHelper
	include UsersHelper
  def friends?(id)
    Friendship.find_by(user_id:current_user.id, friend_id: id, accepted: true)
  end
  def pending?(id)
      Friendship.find_by(user_id:current_user.id, friend_id: id, accepted: false)
  end
end
