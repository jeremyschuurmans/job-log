class ApplicationsController < ApplicationController
  # before_action :check_if_user_logged_in
  # before_action :is_this_the_right_user?

  def index
  end

  def new
    @application = Application.new
  end

  def create
    @user = User.find_by(params[:id])
    @company = Company.find_by(name: params[:application][:company_name])
    @application = Application.find_by(id: @company.id)
    @application.update(application_params)
    if @application.save
      redirect_to company_application_url(id: @application.id)
      flash[:notice] = "Success!"
    else
      render 'new'
      flash[:alert] = "Application not saved."
    end
  end

  def show
    @application = Application.find_by(params[:id])
  end

  private

    def application_params
      params.require(:application).permit(:company_name, :date, :followup, :response)
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
