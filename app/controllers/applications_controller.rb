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

  def new
    @user = current_user
    @application = Application.new
  end

  def create
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

  def edit
    @application = Application.find_by(id: params[:id])
  end

  def update
    @application = Application.find(params[:id])
    if @application.update(application_params)
      flash[:success] = "Application edited!"
      redirect_to company_application_url(@application)
    else
      flash[:danger] = "Application not edited."
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
