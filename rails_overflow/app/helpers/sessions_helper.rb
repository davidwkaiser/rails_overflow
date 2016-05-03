module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
    puts session[:user_id]
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def log_out
    session[:user_id]
    session.delete(:user_id)
    @current_user = nil
  end
end
