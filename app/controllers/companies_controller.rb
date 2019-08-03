class CompaniesController < ApplicationController

  def index
  end

  def new
    @company = Company.new
    @user = User.find_by(params[:id])
  end

  def create
    @user = User.find_by(params[:id]) #change to current_user and create current_user method when this works
    @company = @user.companies.build(company_params)
    if @company.save
      @user.companies << @company
      redirect_to companies_url
      flash[:notice] = "Success!"
    else
      render 'new'
      flash[:alert] = "Company not saved."
    end
  end

  private

    def company_params
      params.require(:company).permit(:name, :address, :telephone_number, :contact_person, :user_id)
    end
end
