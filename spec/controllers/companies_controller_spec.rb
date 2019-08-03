require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  render_views

  describe "Index" do
    it "loads the companies index page" do
      get :index
      expect(response.status).to eq(200)
      expect(response.body).to include("Companies")
    end

    it "displays all companies" do
    end
  end

  describe "New" do
    it "loads a new company form" do
      user = User.create(name: "Grace Hopper",
                         email: "admiralgrace@googlemail.com",
                         password: "securepassword")
      get :new
      expect(response.status).to eq(200)
      expect(response.body).to include("Submit Company")
    end

    it "instantiates a new company" do
      company = Company.new

      expect(company).to be_a_new(Company)
    end
  end

end
