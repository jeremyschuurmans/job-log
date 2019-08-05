require 'rails_helper'

RSpec.describe ApplicationsController, type: :controller do
  render_views

  describe "Index" do
    it "loads the applications index page" do
      get :index
      expect(response.status).to eq(200)
      expect(response.body).to include("Applications")
    end

    it "displays all applications" do
    end
  end

  describe "New" do
    it "loads a new application form" do
      application = Application.create(company: "Pied Piper",
                                       date: 9/25/2019,
                                       followup: false,
                                       response: nil)
      get :new
      expect(response.status).to eq(200)
      expect(response.body).to include("Submit Application")
    end

    it "instantiates a new application" do
      application = Application.new

      expect(application).to be_a_new(Application)
    end
  end
end
