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
  end

  describe "New" do

    it "instantiates a new application" do
      application = Application.new

      expect(application).to be_a_new(Application)
    end
  end

  describe "Create" do
    it "populates application datafields in database" do
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
      expect(company.id).to eq(2)
      expect(Application.last.company_id).to eq(company.id)
      expect(Application.last.company_name).to eq(nil)

      application = Application.find_by(company_id: company.id)
      application.update(company_name: company.name, date: "2019-10-22")
      expect(Application.last.company_id).to eq(company.id)
      expect(Application.last.company_name).to eq(company.name)
    end
  end

  # describe "Edit" do
  #   it "can edit an application's information" do
  #     user = User.create(name: "Grace Hopper",
  #                        email: "admiralgrace@googlemail.com",
  #                        password: "securepassword")
  #
  #     log_in(user)
  #     company = user.companies.build(name: "Pied Piper",
  #                                     address: { :street_address =>  "12341234 Recursion Way",
  #                                                :city => "Portland",
  #                                                :state => "Oregon",
  #                                                :zip_code => 97224 },
  #                                     telephone_number: 555-555-5555,
  #                                     contact_person: "Nelson Bighetti")
  #
  #     company.save
  #
  #     application = Application.find_by(company_id: company.id)
  #
  #     patch :update, params: { company_id: application.company_id, id: company.id, application: { date: "2019-08-18" } }
  #     application.reload
  #     expect(application.company_name).to eq("Pied Piper")
  #     expect(application.date).to eq("2019-08-18")
  #   end
  # end
end
