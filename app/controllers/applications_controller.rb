class ApplicationsController < ApplicationController
  before_action :check_if_user_logged_in
  before_action :does_this_application_belong_to_this_user?, only: [:show, :edit, :update, :delete]
  layout "form_page", only: [:show, :edit]

  def index
    @user = current_user
    @applications = @user.applications.all
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
    @company = Company.find(params[:id])
    @application = Application.find(params[:id])
    if @application.update(application_params)
      set_applied_to_true_in_company if @company.applied != true
      remove_response_if_followup_is_set_to_false
      flash[:success] = "Success!"
      redirect_to company_application_url(@application)
    else
      flash[:danger] = "Something went wrong."
      redirect_to edit_company_application_url(@application)
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @application = Application.find(params[:id])
    if @application.destroy
      @company.applied = false
      @company.save
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

    def set_applied_to_true_in_company
      @company.applied = true
      @company.save
    end

    def remove_response_if_followup_is_set_to_false
      if @application.followup == false && @application.response != ""
        @application.response = ""
        @application.save
      end
    end
end
