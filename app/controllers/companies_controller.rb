class CompaniesController < ApplicationController
  before_action :check_if_user_logged_in
  # only: [:new, :create, :show]
  # before_action :is_this_the_right_user?, only: [:new, :create, :show]


  def index
    @companies = Company.all
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
      redirect_to @company
      flash[:notice] = "Success!"
    else
      render 'new'
      flash[:alert] = "Company not saved."
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  private

    def company_params
      params.require(:company).permit(:name, :address, :telephone_number, :contact_person)
    end
end
