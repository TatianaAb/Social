class UserController < ApplicationController
  def index
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end

  def search
    @users = User.where('name LIKE ?', "%#{params[:search]}%").all
    render '/users/search'
  end

  def show
    @user = User.find_by_id(params[:id])
    @posts = Post.where(receiver_id: @user.id)
    @like = Like.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
