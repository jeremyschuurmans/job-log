require 'rails_helper'
include UsersHelper
include SessionsHelper

RSpec.describe CompaniesController, type: :controller do
  render_views

  describe "Index" do
    it "loads the companies index page" do
      user = User.create(name: "Grace Hopper",
                         email: "admiralgrace@googlemail.com",
                         password: "securepassword")
      log_in(user)
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
      log_in(user)
      get :new
      expect(response.status).to eq(200)
      expect(response.body).to include("Submit Company")
    end

    it "instantiates a new company" do
      company = Company.new

      expect(company).to be_a_new(Company)
    end
  end

  describe "Create" do
    it "perists a new company to the database" do
      user = User.create(name: "Grace Hopper",
                         email: "admiralgrace@googlemail.com",
                         password: "securepassword")
      company = user.companies.create(name: "Pied Piper",
                            address: { :street_address =>  "12341234 Recursion Way",
                                       :city => "Portland",
                                       :state => "Oregon",
                                       :zip_code => 97224 },
                            telephone_number: 555-555-5555,
                            contact_person: "Nelson Bighetti")

      expect(company.name).to eq("Pied Piper")
      expect(company.id).to eq(3)
    end
  end

  describe "Show" do
    it "shows a company's information" do
      user = User.create(name: "Grace Hopper",
                         email: "admiralgrace@googlemail.com",
                         password: "securepassword")

      company = Company.create(name: "Pied Piper",
                            address: { :street_address =>  "12341234 Recursion Way",
                                       :city => "Portland",
                                       :state => "Oregon",
                                       :zip_code => 97224 },
                            telephone_number: 555-555-5555,
                            contact_person: "Nelson Bighetti")

      log_in(user)
      get :show, params: { id: company.id }
      expect(response.status).to eq(200)
      expect(response.body).to include("Pied Piper")
    end
  end

  describe "Edit" do
    it "can edit a company's information" do
      user = User.create(name: "Grace Hopper",
                         email: "admiralgrace@googlemail.com",
                         password: "securepassword")

      company = Company.create(name: "Pied Piper",
                               address: { :street_address =>  "12341234 Recursion Way",
                                          :city => "Portland",
                                          :state => "Oregon",
                                          :zip_code => 97224 },
                               telephone_number: 555-555-5555,
                               contact_person: "Nelson Bighetti")

      log_in(user)
      patch :update, params: { id: company.id, company: { name: "Apple Computer" } }
      company.reload
      expect(company.name).to eq("Apple Computer")
    end
  end

  describe "Delete" do
    it "deletes a company from the database" do
      user = User.create(name: "Grace Hopper",
                         email: "admiralgrace@googlemail.com",
                         password: "securepassword")

      company = user.companies.create(name: "Pied Piper",
                                      address: { :street_address =>  "12341234 Recursion Way",
                                                 :city => "Portland",
                                                 :state => "Oregon",
                                                 :zip_code => 97224 },
                                      telephone_number: 555-555-5555,
                                      contact_person: "Nelson Bighetti")

      log_in(user)
      delete :destroy, params: { id: company.id }
      expect(flash[:success]).to eq("Company deleted!")
    end
  end
end
