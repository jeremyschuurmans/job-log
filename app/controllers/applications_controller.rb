class ApplicationsController < ApplicationController
  before_action :check_if_user_logged_in
  # before_action :is_this_the_right_user?

  def index
  end

  def new
    @application = Application.new
  end

  def create
    @user = current_user
    @company = Company.find_by(name: params[:application][:company_name])
    @application = Application.find_by(company_id: @company.id)
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
    @application = Application.find_by(id: params[:id])
  end

  private

    def application_params
      params.require(:application).permit(:company_name, :date, :followup, :response)
    end

end
