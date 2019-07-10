require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  render_views

  describe "Homepage" do
    it 'loads the homepage' do
      get :index
      expect(response.status).to eq(200)
      expect(response.body).to include("Welcome to JobLog")
    end

    it 'contains a sign up link' do
      get :index
      expect(response.status).to eq(200)
      expect(response.body).to include("Sign Up")
    end

    it 'contains a log in link' do
      get :index
      expect(response.status).to eq(200)
      expect(response.body).to include("Log In")
    end
  end
end
