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
      redirect_to questions_path
    else
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end


end
