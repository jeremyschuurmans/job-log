class ApplicationsController < ApplicationController
  before_action :check_if_user_logged_in
  before_action :does_this_application_belong_to_this_user?, only: [:show, :edit, :update, :delete]

  def index
    @user = current_user
    @applications = @user.applications.all.where.not(company_name: nil).order(date: :desc).limit(5)
    respond_to do |format|
      format.html
      format.json { render json: @applications }
    end
  end

  def show
    @application = Application.find_by(id: params[:id])
  end

  def edit
    @company = Company.find_by(id: params[:id])
    @application = Application.find_by(id: params[:id])
  end

  def update
    @application = Application.find(params[:id])
    if @application.update(application_params)
      flash[:success] = "Success!"
      redirect_to company_application_url(@application)
    else
      flash[:danger] = "Something went wrong."
      redirect_to edit_company_application_url(@application)
    end
  end

  def destroy
    @application = Application.find(params[:id])
    if @application.destroy
      flash[:success] = "Application deleted!"
      redirect_to applications_url
    else
      flash[:danger] = "Application not deleted."
      redirect_to company_application_url(@application)
    end
  end

  private

    def application_params
      params.require(:application).permit(:company_name, :date, :followup, :response)
    end

end
