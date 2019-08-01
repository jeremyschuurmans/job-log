class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      log_in @user
      redirect_to companies_url
      flash[:notice] = "Success!"
    elsif User.exists?(name: @user.name, email: @user.email)
      redirect_to login_url
      flash[:alert] = "User exists. Please log in."
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
