class UsersController < ApplicationController
  include UsersHelper
  before_action :check_if_user_logged_in, only: [:edit, :update]
  before_action :is_this_the_right_user?, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Success!"
      redirect_to companies_url
    elsif user_exists?
      flash[:danger] = "User exists. Please log in."
      redirect_to login_url
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:success] = "Information updated!"
      redirect_to companies_url
    else
      flash[:danger] = "Something went wrong."
      redirect_to edit_user_url(@user)
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

    def user_exists?
      User.exists?(name: @user.name, email: @user.email)
    end

end
