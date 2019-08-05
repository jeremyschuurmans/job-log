class ApplicationsController < ApplicationController

  def index
  end

  def new
    @application = Application.new
  end

  def create
    @user = User.find_by(params[:id])
    @application = @user.applications.build(application_params)
  end

  private

    def application_params
      params.require(:application).permit(:company, :date, :followup, :response, :application_id)
    end
end
