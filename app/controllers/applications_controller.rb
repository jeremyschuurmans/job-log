class ApplicationsController < ApplicationController

  def index
  end

  def new
    @application = Application.new
  end

  def create
    @user = User.find_by(params[:id])
    @company = Company.find_by(name: params[:application][:company])
    @application = @user.applications.build(application_params)
    if @application.save
      @company.application_id = @application.application_id
      # @user.applications << @application
      redirect_to companies_url
      flash[:notice] = "Success!"
    else
      render 'new'
      flash[:alert] = "Application not saved."
    end
  end

  private

    def application_params
      params.require(:application).permit(:company, :date, :followup, :response, :application_id)
    end
end
