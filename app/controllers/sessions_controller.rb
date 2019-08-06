class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_back_or companies_url
    else
      flash[:alert] = "Username or password is invalid."
      redirect_to login_url
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
