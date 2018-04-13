module UserHelper
	def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def target_user
    @user = User.find_by_id(params[:user_id])
  end

  def require_user
    redirect '/users/new' unless current_user
  end

  def login?
    !!current_user
  end

  def authorized?(id)
    current_user.id == id.to_i
  end

  def authorize(id)
    redirect_to "/users/#{current_user.id}" unless authorized?(id)
  end

  def get_user(id)
    User.find_by_id(id)
  end
end
