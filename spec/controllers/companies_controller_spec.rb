require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  render_views

  describe "Index" do
    it "loads the companies index page" do
      get :index
      expect(response.status).to eq(200)
      expect(response.body).to include("Companies")
    end
  end

end
