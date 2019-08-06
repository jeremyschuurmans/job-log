class UsersController < ApplicationController
  before_action :check_if_user_logged_in, only: [:edit, :update]
  before_action :is_this_the_right_user?, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      log_in @user
      redirect_to companies_url
      flash[:notice] = "Success!"
    elsif user_exists?
      redirect_to login_url
      flash[:danger] = "User exists. Please log in."
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

    def user_exists?
      User.exists?(name: @user.name, email: @user.email)
    end

    def check_if_user_logged_in
      unless logged_in?
        set_forwarding_url
        flash[:danger] = "Please log in to continue."
        redirect_to login_url
      end
    end

    def is_this_the_right_user?
      @user = User.find(params[:id])
      redirect_to root_url unless current_user?(@user)
    end

end
