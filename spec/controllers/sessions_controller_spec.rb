require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  render_views

  describe "Log in page" do
    it 'loads the log in page' do
      get :new
      expect(response.status).to eq(200)
      expect(response.body).to include("Log In")
    end
  end
end
