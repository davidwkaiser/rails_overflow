class SessionsController < ApplicationController

  def new

  end


  def current_user
    User.find_by(id: session[:user_id])
  end

  def create
    email = params[:session][:email]
    password = params[:session][:password]
    @user = User.find_by(email: email)

    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      p session[:user_id]
      redirect_to questions_path
    else
      render 'new'
    end
  end

  def destroy
    p session[:user_id]
    session.delete(:user_id)
    @current_user = nil
    redirect_to questions_path
  end
end
