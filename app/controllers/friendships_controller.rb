class FriendshipsController < ApplicationController
  def index
    target_user
    authorize(params[:user_id])
    @friends_added_me = Friendship.where(friend_id: params[:user_id], accepted: true)
    @friends_I_added = Friendship.where(user_id: current_user.id, accepted: true)
    @friends =  @friends_I_added + @friends_added_me
    @friend_requests = Friendship.where(friend_id:current_user.id, accepted:false)
  end

  def create
    target_user
    @friendship = Friendship.new(user_id:current_user.id, friend: User.find(params[:user_id]))
    if @friendship.save
      redirect_to user_path(params[:user_id])
    else
      @friendship.errors.full_messages
      redirect_to user_path(params[:user_id])
    end
  end

  def update
    target_user
    @friendship = Friendship.find_by(user_id: params[:id])
    @friendship.update(accepted: true)
    redirect_to "/users/#{@friendship.friend_id}/friendships"
  end

  def destroy
    @friendship = Friendship.find_by(user_id: params[:id], friend_id: current_user.id)
    if authorized?(@friendship.friend_id)
      @friendship.destroy
      redirect_to "/users/#{current_user.id}/friendships"
    end
  end
end
