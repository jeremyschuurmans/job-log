class CompaniesController < ApplicationController

  def index
  end

  def new
    @company = Company.new
    @user = User.find_by(params[:id])
  end
end
