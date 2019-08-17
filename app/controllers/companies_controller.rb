class CompaniesController < ApplicationController
  before_action :check_if_user_logged_in
  before_action :does_this_company_belong_to_this_user?, only: [:show, :edit, :update, :destroy]
  layout "form_page", only: [:new, :show, :edit]


  def index
    @user = current_user
    @companies = @user.companies.all.order(:id)
    respond_to do |format|
      format.html
      format.json { render json: @companies }
    end
  end

  def new
    @user = current_user
    @company = Company.new
  end

  def create
    @user = current_user
    @company = @user.companies.build(company_params)
    if @company.save
      @user.companies << @company
      find_and_update_associated_application
      flash[:success] = "Success! You're on your way!"
      render json: @company
      # redirect_to @company
    else
      flash[:danger] = "Company not saved."
      render 'new'
    end
  end

  def show
    @company = Company.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @company }
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      flash[:success] = "Company edited!"
      redirect_to @company
    else
      flash[:danger] = "Company not edited."
      redirect_to edit_company_url(@company)
    end
  end

  def destroy
    @company = Company.find(params[:id])
    if @company.destroy
      flash[:success] = "Company deleted!"
      redirect_to companies_url
    else
      flash[:danger] = "Company not deleted!"
      redirect_to @company
    end
  end

  private

    def company_params
      params.require(:company).permit(:name, :telephone_number, :contact_person, :applied, address: [:street_address, :city, :state, :zip_code])
    end

    def find_and_update_associated_application
      @application = Application.find_by(company_id: @company.id)
      @application.company_name = @company.name
      @application.save
    end
end
