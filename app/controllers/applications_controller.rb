class ApplicationsController < ApplicationController

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
      redirect_to companies_url
      flash[:notice] = "Success!"
    else
      render 'new'
      flash[:alert] = "Application not saved."
    end
  end

  private

    def application_params
      params.require(:application).permit(:company_name, :date, :followup, :response)
    end
end
