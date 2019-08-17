class UsersController < ApplicationController
  include UsersHelper
  before_action :check_if_user_logged_in, only: [:edit, :update, :destroy]
  before_action :is_this_the_right_user?, only: [:edit, :update, :destroy]
  layout "form_page"

  def new
    @user = User.new
    render layout: "form_page"
  end

  def create
    @user = User.new(user_params)
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
    render layout: "form_page"
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

  def destroy
    @user = current_user
    if @user.destroy
      flash[:alert] = "We're sorry to see you go!"
      redirect_to root_url
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
