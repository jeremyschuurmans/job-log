class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to companies_url
    else
      redirect_to login_url
      flash[:alert] = "Username or password is invalid."
    end
  end
end
