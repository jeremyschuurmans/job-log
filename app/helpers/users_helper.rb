module UsersHelper

  def check_if_user_logged_in
    unless logged_in?
      set_forwarding_url
      flash[:alert] = "Please log in to continue."
      redirect_to login_url
    end
  end

  def is_this_the_right_user?
    @user = User.find_by(id: params[:id])
    redirect_to root_url unless current_user?(@user)
  end

  def does_this_company_belong_to_this_user?
    @company = current_user.companies.find_by(id: params[:id])
    redirect_to root_url if @company.nil?
  end

  def does_this_application_belong_to_this_user?
    @application = current_user.applications.find_by(id: params[:id])
    redirect_to root_url if @application.nil?
  end
end
