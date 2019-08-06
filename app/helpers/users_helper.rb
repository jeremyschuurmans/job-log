module UsersHelper

  def check_if_user_logged_in
    unless logged_in?
      set_forwarding_url
      flash[:alert] = "Please log in to continue."
      redirect_to login_url
    end
  end

  def is_this_the_right_user?
    @user = User.find(params[:id])
    redirect_to root_url unless current_user?(@user)
  end
end
