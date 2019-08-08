require 'rails_helper'

RSpec.describe ApplicationsController, type: :controller do
  render_views
  include UsersHelper
  include SessionsHelper

  describe "Index" do
    it "loads the applications index page" do
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
      get :index, params: { company_id: company.id }
      expect(response.status).to eq(200)
      expect(response.body).to include("Applications")
    end

    it "displays all applications" do
    end
  end

  describe "New" do
    it "loads a new application form" do
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
      # application = Application.create(company_name: "Pied Piper",
      #                                  date: 9/25/2019,
      #                                  followup: false,
      #                                  response: nil)
      log_in(user)
      get :new, params: { company_id: company.id }
      expect(response.status).to eq(200)
      expect(response.body).to include("Submit Application")
    end

    it "instantiates a new application" do
      application = Application.new

      expect(application).to be_a_new(Application)
    end
  end
end
