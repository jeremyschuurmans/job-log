class CompaniesController < ApplicationController

  def index
  end

  def new
    @company = Company.new
  end
end
