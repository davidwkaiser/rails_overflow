class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    p user_params[:password]
    @user.password = user_params[:hashed_password]
    @user.save!
    redirect_to questions_path
  end

  private
    def user_params
      params.require(:user).permit(:email, :hashed_password)
    end
end
